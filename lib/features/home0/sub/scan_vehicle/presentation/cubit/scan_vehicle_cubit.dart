import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/use_cases/scan_vehicle_use_case.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/presentation/cubit/scan_vehicle_state.dart';

class ScanVehicleCubit extends Cubit<ScanVehicleState> {
  final ScanVehicleUseCase _scanVehicleUseCase;

  ScanVehicleCubit(this._scanVehicleUseCase) : super(ScanVehicleInitialState());

  Future<void> getScanVehicleMethod(String vin) async {
    final result = await _scanVehicleUseCase.decodeVin(vin);
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  final picker = ImagePicker();

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

      // final text = await FlutterTesseractOcr.extractText(
      //   image.path,
      //   language: 'eng',
      //   args: {
      //     "psm": "4",
      //     "preserve_interword_spaces": "1",
      //   },
      // );
      // final text =
      //     await FlutterTesseractOcr.extractText(
      //   image.path,
      //   language: 'eng',
      // );

      final vinRegex = RegExp(r'\b[A-HJ-NPR-Z0-9]{17}\b');

      final match = vinRegex.firstMatch(text);

      if (match == null) {
        emit(ScanVehicleErrorState(message: 'VIN not found'));
        return;
      }

      final vin = match.group(0)!;

      final result = await _scanVehicleUseCase.decodeVin(vin);

      result.when(
        (success) {
          emit(ScanVehicleSuccessState(success));
        },
        (error) {
          emit(ScanVehicleErrorState(message: error.message));
        },
      );
    } catch (error) {
      emit(ScanVehicleErrorState(message: error.toString()));
    }
  }



Future<void> scanVehicle0() async {    try {      emit(ScanVehicleLoadingState());      final image = await picker.pickImage(        source: ImageSource.camera,      );      if (image == null) {        emit(          ScanVehicleErrorState(            message: 'No image selected',          ),        );        return;      }      final inputImage =          InputImage.fromFilePath(        image.path,      );      final textRecognizer =          TextRecognizer();      final RecognizedText recognizedText =          await textRecognizer.processImage(        inputImage,      );      final text = recognizedText.text;      await textRecognizer.close();      final cleanedText = text          .replaceAll(' ', '')          .replaceAll('\n', '')          .toUpperCase();      final vinRegex = RegExp(        r'[A-HJ-NPR-Z0-9]{17}',      );      final match =          vinRegex.firstMatch(cleanedText);      if (match == null) {        emit(          ScanVehicleErrorState(            message: 'VIN not found',          ),        );        return;      }      final vin = match.group(0)!;      await getScanVehicleMethod(vin);    } catch (error) {      emit(        ScanVehicleErrorState(          message: error.toString(),        ),      );    }  }  
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
