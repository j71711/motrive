import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class BaseImagePickerService {
  Future<File?> pickImage();
}

@LazySingleton(as: BaseImagePickerService)
class ImagePickerService implements BaseImagePickerService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image == null) return null;

    return File(image.path);
  }
}