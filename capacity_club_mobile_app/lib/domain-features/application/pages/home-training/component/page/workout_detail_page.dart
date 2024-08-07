import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/core/widgets/app_logo_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/entity/exercise_data_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-training/exercise-data/entity/exercise_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/workout/entity/workout_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutDetailPage extends StatelessWidget {
  WorkoutDetailPage({super.key});
  final workout = WorkoutEntity(
    workout_id: UniqueId('1'),
    title: 'Full Body Workout',
    training_circuits: [
      TrainingCircuitEntity(
        training_circuit_id: UniqueId('circuit1'),
        title: 'Warm-Up',
        exercise_training_list: [
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex1'),
            nb_reps: 15,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData1'),
              title: 'Jumping Jacks',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex2'),
            nb_reps: 20,
            intensity: 'Medium',
            intensityType: TrainingIntensity.medium,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData2'),
              title: 'High Knees',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex3'),
            nb_reps: 10,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData3'),
              title: 'Butt Kicks',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex4'),
            nb_reps: 12,
            intensity: 'Medium',
            intensityType: TrainingIntensity.medium,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData4'),
              title: 'Arm Circles',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex5'),
            nb_reps: 10,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData5'),
              title: 'Lunges',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
        ],
        is_empty: false,
      ),
      TrainingCircuitEntity(
        training_circuit_id: UniqueId('circuit2'),
        title: 'Strength Training',
        exercise_training_list: [
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex6'),
            nb_reps: 15,
            intensity: 'High',
            intensityType: TrainingIntensity.high,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData6'),
              title: 'Push-Ups',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex7'),
            nb_reps: 20,
            intensity: 'Medium',
            intensityType: TrainingIntensity.medium,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData7'),
              title: 'Squats',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex8'),
            nb_reps: 10,
            intensity: 'High',
            intensityType: TrainingIntensity.high,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData8'),
              title: 'Lunges',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex9'),
            nb_reps: 12,
            intensity: 'Medium',
            intensityType: TrainingIntensity.medium,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData9'),
              title: 'Plank',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex10'),
            nb_reps: 10,
            intensity: 'High',
            intensityType: TrainingIntensity.high,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData10'),
              title: 'Deadlift',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
        ],
        is_empty: false,
      ),
      TrainingCircuitEntity(
        training_circuit_id: UniqueId('circuit3'),
        title: 'Cool Down',
        exercise_training_list: [
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex11'),
            nb_reps: 15,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData11'),
              title: 'Child Pose',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex12'),
            nb_reps: 20,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData12'),
              title: 'Hamstring Stretch',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex13'),
            nb_reps: 10,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData13'),
              title: 'Quad Stretch',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex14'),
            nb_reps: 12,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData14'),
              title: 'Shoulder Stretch',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
          ExerciseTrainingEntity(
            exercise_training_id: UniqueId('ex15'),
            nb_reps: 10,
            intensity: 'Low',
            intensityType: TrainingIntensity.low,
            exercise_data: ExerciseDataEntity(
              exercise_data_id: UniqueId('exData15'),
              title: 'Cat-Cow Stretch',
              description: [],
              categories: [],
              video_youtube_link: '',
              video_asset_link: '',
              exercise_training_list: [],
              is_empty: false,
            ),
            is_empty: false,
          ),
        ],
        is_empty: false,
      ),
    ],
    is_empty: false,
  );

  Widget build(BuildContext context) {
    return _WorkoutDetailPageContent(workout: workout);
  }
}

class _WorkoutDetailPageContent extends StatefulWidget {
  final WorkoutEntity workout;

  const _WorkoutDetailPageContent({super.key, required this.workout});

  @override
  __WorkoutDetailPageContentState createState() =>
      __WorkoutDetailPageContentState();
}

class __WorkoutDetailPageContentState extends State<_WorkoutDetailPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                appLogo(context),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    widget.workout.title,
                    style: AppTheme.titleTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        color: ThemeColor.dustyGray,
                      ), // Durée
                      SizedBox(width: 8),
                      Text(
                        'Durée : 60\'',
                        style: AppTheme.subTitleTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.clipboardList,
                        color: ThemeColor.dustyGray,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Nombre de trainings : 3',
                        style: AppTheme.subTitleTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.dumbbell,
                        color: ThemeColor.dustyGray,
                      ), // Nombre d'exercices
                      SizedBox(width: 8),
                      Text(
                        'Nombre d\'exercices : 18',
                        style: AppTheme.subTitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Espace ajouté entre le titre principal et les ExpansionTile
            Column(
              children: [
                ...widget.workout.training_circuits.map((circuit) {
                  return ExpansionTile(
                    title: Center(
                      child: Text(
                        circuit.title,
                        style: AppTheme.mediumTitleTextStyle,
                      ),
                    ),
                    iconColor: ThemeColor.mainColor,
                    collapsedIconColor: ThemeColor.dustyGray,
                    children: circuit.exercise_training_list.map((exercise) {
                      return ListTile(
                        title: Text(exercise.exercise_data.title,
                            style: AppTheme.subTitleTextStyle),
                        subtitle: Text(
                          '${exercise.nb_reps} reps - ${exercise.intensity} intensity',
                          style: AppTheme.subTitleItalicTextStyle,
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
                const SizedBox(height: 32),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ThemeColor.mainColor,
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Start Workout',
                            style: AppTheme.whiteTypeMedium14,
                            textAlign: TextAlign.center)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
