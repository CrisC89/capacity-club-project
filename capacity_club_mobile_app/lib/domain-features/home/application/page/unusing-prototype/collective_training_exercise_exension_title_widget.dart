import 'package:capacity_club_mobile_app/domain-features/common-features/application/widget/exercise-video-player/exercise_video_player_screen.dart';
import 'package:flutter/material.dart';

class ExerciseExpansionTile extends StatelessWidget {
  final String title;
  final List<String> exercises;

  const ExerciseExpansionTile({
    super.key,
    required this.title,
    required this.exercises,
  });

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
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        color: Colors.white, // Couleur de fond de la carte
        child: ExpansionTile(
          title: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.grey[800], // Couleur du texte de l'en-tête
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          children: [
            Container(
              color: Colors.white, // Couleur de fond de la liste d'exercices
              child: Column(
                children: exercises
                    .map(
                      (exercise) => ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                exercise.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[
                                      800], // Couleur du texte des exercices
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.camera_alt,
                                  color:
                                      Colors.grey[600]), // Couleur de l'icône
                              onPressed: () {
                                showFullScreenVideo(context,
                                    'assets/videos/alternated_kb_clean.mp4');
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
