import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_module.dart';
import 'home.dart';
import 'login.dart';
import 'menu.dart';
import 'signup.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameraList = await availableCameras();

  // open just front camera
  final cam = cameraList.last;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Avatar',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/LOG_IN': (context) => LoginScreen(),
        '/CREATE_AVATAR': (context) => SignUpScreen(
              camera: cam,
            ),
        '/LOG_IN/MAIN_MENU': (context) => MainMenu(),
        '/CAMERA': (context) => TakePictureScreen(
              camera: cam,
            ),
      },
    ),
  );
}
