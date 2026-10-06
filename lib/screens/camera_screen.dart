import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recandroidapp/controllers/camera_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Usando a Câmera")),

      body: Consumer<CameraController>(
        builder: (context, cameraController, child) => ListView(
          padding: EdgeInsets.all(16),
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blueGrey[50]),
                  width: double.infinity,
                  height: 300,
                  child: cameraController.carregando
                      ? CircularProgressIndicator()
                      : cameraController.imagemSelecionada != null
                      ? Image.file(cameraController.imagemSelecionada!)
                      : Icon(Icons.image),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: IconButton(onPressed: () => cameraController.tirarFoto(),
                  icon: Icon(Icons.camera_alt)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
