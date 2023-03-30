import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraServices {
  static XFile? imageFile;
  static final ImagePicker picker = ImagePicker();
  static captureImage() async {
    imageFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    return imageFile!.path;
  }
}
