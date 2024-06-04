import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseVideoPlayer extends StatefulWidget {
  final String videoPath;

  const ExerciseVideoPlayer({super.key, required this.videoPath});

  @override
  _ExerciseVideoPlayerState createState() => _ExerciseVideoPlayerState();
}

class _ExerciseVideoPlayerState extends State<ExerciseVideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(widget.videoPath)
        ..addListener(() {
          if (flickManager
                  .flickVideoManager?.videoPlayerController?.value.position ==
              flickManager
                  .flickVideoManager?.videoPlayerController?.value.duration) {
            flickManager.flickControlManager
                ?.seekTo(const Duration(seconds: 0));
            flickManager.flickControlManager?.play();
          }
        }),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  Widget videoPlayer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double videoHeight = screenHeight / 3; // 1/3 of the screen height

    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: videoHeight / (screenWidth * (16 / 9)),
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: const FlickVideoWithControls(
            closedCaptionTextStyle: TextStyle(fontSize: 8),
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double videoHeight = screenHeight * 0.60;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: videoHeight,
              child: videoPlayer(context),
            ),
            SizedBox(height: 30),
            exerciseDescription(context),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget exerciseDescription(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Squat",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "1. Tenez-vous debout, pieds écartés à la largeur des épaules.",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "2. Pliez les genoux et descendez comme pour vous asseoir.",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "3. Maintenez la position, dos droit.",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "4. Remontez en poussant sur les talons.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
