import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/model/entities/unique_id.dart';
import 'package:capacity_club_mobile_app/domain-features/data/exercise-training/model/enum/training_intensity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-data/entity/exercise_data_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/exercise-training/exercise-data/entity/exercise_training_entity.dart';
import 'package:capacity_club_mobile_app/domain-features/domain/training-circuit/entity/training_circuit_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'training_circuit_event.dart';
part 'training_circuit_state.dart';

class TrainingCircuitBloc
    extends Bloc<TrainingCircuitEvent, TrainingCircuitState> {
  TrainingCircuitBloc() : super(TrainingCircuitInitial()) {
    on<LoadTrainingCircuits>(_onLoadTrainingCircuits);
    on<NextCircuit>(_onNextCircuit);
  }

  void _onLoadTrainingCircuits(
      LoadTrainingCircuits event, Emitter<TrainingCircuitState> emit) async {
    emit(TrainingCircuitLoading());

    final circuits = [
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
    ];

    try {
      emit(TrainingCircuitLoaded(circuits: circuits, currentIndex: 0));
    } catch (e) {
      emit(TrainingCircuitError(message: e.toString()));
    }
  }

  void _onNextCircuit(
      NextCircuit event, Emitter<TrainingCircuitState> emit) async {
    if (state is TrainingCircuitLoaded) {
      final loadedState = state as TrainingCircuitLoaded;
      if (loadedState.currentIndex < loadedState.circuits.length - 1) {
        emit(TrainingCircuitLoaded(
            circuits: loadedState.circuits,
            currentIndex: loadedState.currentIndex + 1));
      } else {
        emit(TrainingCircuitEnding());
      }
    }
  }
}
