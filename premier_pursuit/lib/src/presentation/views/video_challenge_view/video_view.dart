import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/presentation/views/bonus_challenge/bonus_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/views/video_challenge_view/video_challenge_view.dart';

@RoutePage()
class VideoView extends StatefulWidget {
  VideoView({super.key, required this.cameraController});

  CameraController cameraController;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  bool _isLoading = true;
  //late CameraController cameraController;
  bool _isRecording = false;
  // @override
  // void dispose() {
  //   widget.cameraController.dispose();
  //   super.dispose();
  // }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    widget.cameraController = CameraController(front, ResolutionPreset.max);
    await widget.cameraController!.initialize();
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    setState(() => _isLoading = false);
    //_initCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(widget.cameraController!),
            Padding(
              padding: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(_isRecording ? Icons.stop : Icons.circle),
                onPressed: () async {
                  await _recordVideo();
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await widget.cameraController.stopVideoRecording();
      setState(() {
        _isRecording = false;
        pickedVideoFile = File(file.path);
        bonusVideoFile = File(file.path);
      });
      Navigator.pop(context);
      // final route = MaterialPageRoute(
      //   fullscreenDialog: true,
      //   builder: (_) => VideoPage(filePath: file.path),
      // );
    } else {
      await widget.cameraController.prepareForVideoRecording();
      await widget.cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }
}
