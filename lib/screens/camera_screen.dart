import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../utilities/camera_keeper.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> cameras = CameraKeeper().cameras;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      // 0 is a back one
      cameras[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            await _controller.lockCaptureOrientation();
            final image = await _controller.takePicture();
            var file = File(image.path);

            if (Platform.isIOS) {
              file = await FlutterExifRotation.rotateImage(path: image.path);
            }

            TextDetector detector = GoogleMlKit.vision.textDetector();
            print('Printing fcking text from shitty pic');
            RecognisedText recognisedText = await detector
                .processImage(InputImage.fromFile(File(image.path)));

            final String text = recognisedText.text;
            print(text);
            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    TextDisplay(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      file: file,
                    ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class TextDisplay extends StatefulWidget {
  final File file;

  const TextDisplay({Key? key, required this.file}) : super(key: key);

  @override
  State<TextDisplay> createState() => _TextDisplayState();
}

class _TextDisplayState extends State<TextDisplay> {

  late Future<RecognisedText> recognisedText;

  @override
  void initState() {
    super.initState();
    TextDetector detector = GoogleMlKit.vision.textDetector();

    recognisedText = detector.processImage(InputImage.fromFile(widget.file));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Take a picture')),
        body: FutureBuilder<RecognisedText>(
          future: recognisedText,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              String text = snapshot.data!.text;
              print(text);
              return Text(text);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}


class DisplayPictureScreen extends StatelessWidget {
  final XFile image;

  DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Display the Picture')),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
        body: Image.file(File(image.path)));
  }
}
