import 'package:camera/camera.dart';

class CameraKeeper {
  static final CameraKeeper _instance = CameraKeeper._internal();

  List<CameraDescription> _cameras = [];

  CameraKeeper._internal();

  factory CameraKeeper() => _instance;

  void loadCameras(List<CameraDescription> cameras) => _cameras = cameras;
  List<CameraDescription> get cameras => _cameras;

  void clearCameras() => _cameras = [];
}