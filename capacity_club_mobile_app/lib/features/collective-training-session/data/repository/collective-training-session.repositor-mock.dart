import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/exercise-trainin-data/domain/entity/exercise-data.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/exercise-training/domain/entity/exercise-training.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/training-circuit/domain/entity/training-circuit.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/workout/domain/entity/workout.entity.dart';
import 'package:either_dart/either.dart';
import '../../domain/repository/collective-training-session.repository.dart';

class CollectiveTrainingSessionRepositoryMock
    implements CollectiveTrainingSessionRepository {
  late List<Workout> workoutList;
  late List<TrainingCircuit> trainingCircuitList;
  late List<ExerciseTraining> exerciseTrainingList;
  late List<ExcerciseData> exerciseDataList;
  late List<CollectiveTrainingSession> collectiveTrainingList;

  CollectiveTrainingSessionRepositoryMock() {
    exerciseDataList = [
      const ExcerciseData(
          exercise_data_id: '1',
          title: 'Squat',
          categories: ['A', 'B'],
          description: ["Step one", "Step Two", "Step three"],
          video_link: ''),
      const ExcerciseData(
          exercise_data_id: '2',
          title: 'Squat Sumo',
          categories: ['A', 'D'],
          description: ["Step one", "Step Two", "Step three"],
          video_link: ''),
      const ExcerciseData(
          exercise_data_id: '3',
          title: 'Abdo',
          categories: ['A', 'B', 'C'],
          description: ["Step one", "Step Two", "Step three"],
          video_link: ''),
      const ExcerciseData(
          exercise_data_id: '4',
          title: 'Crunch',
          categories: ['C', 'D'],
          description: ["Step one", "Step Two", "Step three"],
          video_link: '')
    ];

    exerciseTrainingList = [
      ExerciseTraining(
          exercise_training_id: '1',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exerciseDataList[0]),
      ExerciseTraining(
          exercise_training_id: '1',
          title: 'Exo Traning 2',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exerciseDataList[1]),
      ExerciseTraining(
          exercise_training_id: '3',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exerciseDataList[2]),
      ExerciseTraining(
          exercise_training_id: '4',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exerciseDataList[3])
    ];

    trainingCircuitList = [
      TrainingCircuit(
          training_circuit_id: "1",
          title: 'Traning One',
          exercise_training_list: [
            exerciseTrainingList[0],
            exerciseTrainingList[1]
          ]),
      TrainingCircuit(
          training_circuit_id: "2",
          title: 'Traning One',
          exercise_training_list: [
            exerciseTrainingList[2],
            exerciseTrainingList[1]
          ]),
      TrainingCircuit(
          training_circuit_id: "3",
          title: 'Traning Two',
          exercise_training_list: [
            exerciseTrainingList[2],
            exerciseTrainingList[3]
          ]),
      TrainingCircuit(
          training_circuit_id: "4",
          title: 'Traning One',
          exercise_training_list: [
            exerciseTrainingList[0],
            exerciseTrainingList[3]
          ])
    ];

    workoutList = [
      Workout(workout_id: "1", title: "Workout one", training_circuits: [
        trainingCircuitList[0],
        trainingCircuitList[1],
        trainingCircuitList[2]
      ]),
      Workout(workout_id: "2", title: "Workout two", training_circuits: [
        trainingCircuitList[2],
        trainingCircuitList[1],
        trainingCircuitList[3]
      ]),
      Workout(workout_id: "3", title: "Workout three", training_circuits: [
        trainingCircuitList[3],
        trainingCircuitList[2],
        trainingCircuitList[0]
      ])
    ];

    collectiveTrainingList = [
      CollectiveTrainingSession(
          collective_training_session_id: '1',
          title: 'D1 Session de Formation 1',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workoutList[0]),
      CollectiveTrainingSession(
          collective_training_session_id: '2',
          title: 'D2 Session de Formation 2',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workoutList[1]),
      CollectiveTrainingSession(
          collective_training_session_id: '3',
          title: 'D3 Session de Formation 1',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workoutList[2])
    ];
  }

  @override
  Future<Either<Failure, List<CollectiveTrainingSession>>>
      readAllCollectiveTrainingSession() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(collectiveTrainingList),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, CollectiveTrainingSession>>
      collectiveTrainingSessionById(String id) {
    try {
      final collectiveTraning = collectiveTrainingList
          .where((training) => training.collective_training_session_id == id);
      return Future.delayed(const Duration(milliseconds: 200),
          () => Right(collectiveTraning.first));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
