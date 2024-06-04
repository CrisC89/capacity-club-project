import 'package:capacity_club_mobile_app/domain-features/common-features/exercise-video-player/exercise_video_player_screen.dart';
import 'package:flutter/material.dart';

class PersonalTrainingPage extends StatefulWidget {
  const PersonalTrainingPage({super.key});

  @override
  State<PersonalTrainingPage> createState() => _PersonalTrainingPageState();
}

class _PersonalTrainingPageState extends State<PersonalTrainingPage> {
  void showFullScreenVideo(BuildContext context, String videoPath) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ExerciseVideoPlayer(videoPath: videoPath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () => showFullScreenVideo(
              context, 'assets/videos/alternated_kb_clean.mp4'),
          child: Text("SHOW EXO")),
    );
  }
}
