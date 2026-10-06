import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraService {
  final ImagePicker _imagem = ImagePicker();

  Future<File?> pegarGaleria() async {
    final XFile? imagem = await _imagem.pickImage(source: ImageSource.gallery);
    if (imagem == null) return null;
    return File(imagem.path);
  }

  Future<File?> pegarCamera() async {
    final XFile? imagem = await _imagem.pickImage(source: ImageSource.camera);
    if (imagem == null) return null;
    return File(imagem.path);
  }
}
