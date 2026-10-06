import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recandroidapp/services/camera_service.dart';

class CameraController extends ChangeNotifier {
  final _service = CameraService();
  bool carregando = false;
  String erro = "";

  File? _imagemSelecionada;
  File? get imagemSelecionada => _imagemSelecionada;

  Future<void> pegarImagem() async {
    //ao clicar no botão para pegar uma imagem (câmera ou galeria) chama esse método
    carregando = true;
    notifyListeners();

    try {
      _imagemSelecionada = await _service.pegarGaleria();
    } catch (error) {
      erro = "Erro ao pegar imagem $error";
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  Future<void> tirarFoto() async {
    carregando = true;
    notifyListeners();

    try {
      _imagemSelecionada = await _service.pegarCamera();
    } catch (error) {
      erro = "Erro ao tirar foto $error";
    } finally {
      carregando = false;
      notifyListeners();
    }
  }


}
