import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recandroidapp/controllers/camera_controller.dart';
import 'package:recandroidapp/screens/home_screen.dart';

void main() {
  runApp(
    Inicialize()
  );
}

class Inicialize extends StatelessWidget {
  const Inicialize({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CameraController()),
      ],
      child: Consumer<CameraController>(
        builder: (context, cameraController, _) => MaterialApp(
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      )
    );

  }
}