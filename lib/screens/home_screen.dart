import 'package:flutter/material.dart';
import 'package:recandroidapp/screens/camera_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recursos do Android"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text("Câmera"),
          ListTile(
            title: Text("Câmera"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen())),
          )
        ]
      )
    );
  }
}

