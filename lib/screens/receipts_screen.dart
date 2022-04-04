import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/app_bar_text.dart';
import '../constants/app_colors.dart' as app_colors;
import 'camera_screen.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.backgroundColor,
      appBar: AppBar(
          backgroundColor: app_colors.darkBackgroundColor,
          title: AppBarText('Paragony')),
      body: const Center(child: Text("Lista paragonow")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('ReceiptsScreen - pressed floating action button');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CameraScreen()));
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
