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
                  child: IconButton(
                    onPressed: () => abrirModal(context, cameraController),
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> abrirModal(BuildContext context, CameraController controller) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: 200,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Tirar Foto"),
            onTap: () {
              controller.tirarFoto();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text("Escolher da Galeria"),
            onTap: () {
              controller.pegarImagem();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
