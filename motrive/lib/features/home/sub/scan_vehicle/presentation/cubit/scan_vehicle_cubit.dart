import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motrive/features/home/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:motrive/features/home/sub/scan_vehicle/domain/use_cases/scan_vehicle_use_case.dart';
import 'package:motrive/features/home/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';

class ScanVehicleCubit extends Cubit<ScanVehicleState> {
  final ScanVehicleUseCase _scanVehicleUseCase;

  ScanVehicleCubit(this._scanVehicleUseCase) : super(ScanVehicleInitialState());

  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController vinController = TextEditingController();
  final TextEditingController licensePlateController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  final picker = ImagePicker();

  Future<void> processImage(String imagePath) async {
    try {
      emit(ScanVehicleLoadingState());

      final inputImage = InputImage.fromFilePath(imagePath);

      final textRecognizer = TextRecognizer();

      final recognizedText = await textRecognizer.processImage(inputImage);

      await textRecognizer.close();

      final rawText = recognizedText.text;

      final cleanedText = rawText
          .replaceAll(" ", "")
          .replaceAll("\n", "")
          .toUpperCase();

      final vinRegex = RegExp(r'[A-HJ-NPR-Z0-9]{17}');

      final match = vinRegex.firstMatch(cleanedText);

      if (match == null) {
        emit(const ScanVehicleErrorState(message: "VIN not found"));

        return;
      }

      final vin = match.group(0)!;

      final result = await _scanVehicleUseCase.decodeVin(vin);

      result.when(
        (vehicle) {
          vinController.text = vehicle.vin!;
          makeController.text = vehicle.make!;
          modelController.text = vehicle.model!;
          yearController.text = vehicle.year.toString();
          colorController.text = vehicle.color ?? '';
          licensePlateController.text = vehicle.licensePlate ?? '';
          emit(ScanVehicleSuccessState(vehicle));
        },
        (error) {
          emit(ScanVehicleErrorState(message: error.message));
        },
      );
    } catch (e) {
      emit(ScanVehicleErrorState(message: e.toString()));
    }
  }

  Future<void> scanVehicle() async {
    try {
      emit(ScanVehicleLoadingState());
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) {
        emit(ScanVehicleErrorState(message: 'No image selected'));
        return;
      }

      final inputImage = InputImage.fromFilePath(image.path);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );

      final text = recognizedText.text;

      await textRecognizer.close();

      final cleanedText = text
          .replaceAll(' ', '')
          .replaceAll('\n', '')
          .toUpperCase();

      final vinRegex = RegExp(r'[A-HJ-NPR-Z0-9]{17}');

      final match = vinRegex.firstMatch(cleanedText);

      if (match == null) {
        emit(ScanVehicleErrorState(message: 'VIN not found'));
        return;
      }

      final vin = match.group(0)!;

      final result = await _scanVehicleUseCase.decodeVin(vin);

      result.when(
        (success) async {
          emit(ScanVehicleSuccessState(success));
          await _scanVehicleUseCase.insertVehicle(success);
        },
        (error) {
          emit(ScanVehicleErrorState(message: error.message));
        },
      );
    } catch (error) {
      emit(ScanVehicleErrorState(message: error.toString()));
    }
  }

  ScanVehicleEntity get editedVehicle => ScanVehicleEntity(
    make: makeController.text,
    model: modelController.text,
    year: int.tryParse(yearController.text) ?? 0,
    vin: vinController.text,
  );
  @override
  Future<void> close() {
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    vinController.dispose();
    return super.close();
  }

  Future<void> processScannedText(String text) async {
    emit(ScanVehicleLoadingState());
    final result = await _scanVehicleUseCase.decodeVin(text);
    result.when(
      (vehicle) {
        makeController.text = vehicle.make!;
        modelController.text = vehicle.model!;
        yearController.text = vehicle.year.toString();
        vinController.text = vehicle.vin!;

        emit(ScanVehicleSuccessState(vehicle));
      },
      (error) {
        emit(ScanVehicleErrorState(message: error.message));
      },
    );
  }

  Future<void> saveVehicle() async {
    final vehicle = ScanVehicleEntity(
      make: makeController.text,
      model: modelController.text,
      year: int.tryParse(yearController.text) ?? 0,
      vin: vinController.text,
    );
    final result = await _scanVehicleUseCase.insertVehicle(vehicle);

    result.when(
      (_) {
        emit(ScanVehicleSavedState());
      },
      (error) {
        emit(ScanVehicleErrorState(message: error.message));
      },
    );
  }

  void toggleCamera(bool scanning) {
    emit(ScanVehicleInitialState(scanning: scanning));
  }
}
