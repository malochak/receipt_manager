import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:receipt_manager/screens/landing_screen.dart';
import 'package:receipt_manager/utilities/camera_keeper.dart';

import 'theme/dark_theme.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    List<CameraDescription> cameras = await availableCameras();
    CameraKeeper().loadCameras(cameras);
  } on CameraException catch (e) {
    String code = e.code;
    String description = e.description!;
    print('Error: $code\nError Message: $description');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const appTitle = 'Paragonik';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const LandingScreen(),
      theme: DarkTheme().theme(),
    );
  }
}
