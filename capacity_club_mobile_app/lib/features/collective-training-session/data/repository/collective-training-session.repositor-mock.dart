import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/collective-training-session/domain/entity/collective-training-session.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/exercise-trainin-data/model/exercise-data.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/exercise-training/model/exercise-training.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/training-circuit/model/training-circit.entity.dart';
import 'package:capacity_club_mobile_app/features/core/module/workout/model/workout.entity.dart';
import 'package:either_dart/either.dart';

import '../../domain/repository/collective-training-session.repository.dart';

class CollectiveTrainingSessionRepositoryMock
    implements CollectiveTrainingSessionRepository {
  CollectiveTrainingSessionRepositoryMock() {
    exercises_data = [
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
    exercises_training = [
      ExerciseTraining(
          exercise_training_id: '1',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exercises_data[0]),
      ExerciseTraining(
          exercise_training_id: '1',
          title: 'Exo Traning 2',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exercises_data[1]),
      ExerciseTraining(
          exercise_training_id: '3',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exercises_data[2]),
      ExerciseTraining(
          exercise_training_id: '4',
          title: 'Exo Traning 1',
          nb_reps: 5,
          intensity: '10%',
          member_feedback: 0,
          member_note: "",
          exercise_data: exercises_data[3])
    ];
    training_circuits = [
      TrainingCircuit(
          training_circuit_id: "1",
          title: 'Traning One',
          exercise_training_list: [
            exercises_training[0],
            exercises_training[1]
          ]),
      TrainingCircuit(
          training_circuit_id: "2",
          title: 'Traning One',
          exercise_training_list: [
            exercises_training[0],
            exercises_training[1]
          ]),
      TrainingCircuit(
          training_circuit_id: "3",
          title: 'Traning Two',
          exercise_training_list: [
            exercises_training[2],
            exercises_training[3]
          ]),
      TrainingCircuit(
          training_circuit_id: "4",
          title: 'Traning One',
          exercise_training_list: [
            exercises_training[0],
            exercises_training[3]
          ])
    ];
    workouts = [
      Workout(
          workout_id: "1",
          title: "Workout one",
          training_circuits: [training_circuits[0], training_circuits[1]]),
      Workout(
          workout_id: "2",
          title: "Workout two",
          training_circuits: [training_circuits[2], training_circuits[1]]),
      Workout(
          workout_id: "3",
          title: "Workout three",
          training_circuits: [training_circuits[3], training_circuits[2]]),
      Workout(
          workout_id: "4",
          title: "Workout Four",
          training_circuits: [training_circuits[3], training_circuits[1]]),
      Workout(
          workout_id: "5",
          title: "Workout Five",
          training_circuits: [training_circuits[3], training_circuits[0]])
    ];

    collectiveTrainingList = [
      CollectiveTrainingSession(
          collective_training_session_id: 'id_1',
          title: 'D1 Session de Formation 1',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[0]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_2',
          title: 'D1 Session de Formation 2',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '10:00',
          end_hours: '11:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[1]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_3',
          title: 'D1 Session de Formation 3',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '11:00',
          end_hours: '12:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[2]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_4',
          title: 'D1 Session de Formation 4',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '12:00',
          end_hours: '13:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[3]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_5',
          title: 'D1 Session de Formation 1',
          training_date: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          start_hours: '13:00',
          end_hours: '14:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[4]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_1',
          title: 'D2 Session de Formation 1',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[0]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_2',
          title: 'D2 Session de Formation 2',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '10:00',
          end_hours: '11:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[1]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_3',
          title: 'D2 Session de Formation 3',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '11:00',
          end_hours: '12:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[2]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_4',
          title: 'D2 Session de Formation 4',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '12:00',
          end_hours: '13:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[3]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_5',
          title: 'D2 Session de Formation 5',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 1)),
          start_hours: '13:00',
          end_hours: '14:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[4]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_1',
          title: 'D3 Session de Formation 1',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[0]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_2',
          title: 'D3 Session de Formation 2',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '10:00',
          end_hours: '11:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[1]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_3',
          title: 'D3 Session de Formation 3',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '11:00',
          end_hours: '12:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[2]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_4',
          title: 'D3 Session de Formation 4',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '12:00',
          end_hours: '13:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[3]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_5',
          title: 'D3 Session de Formation 5',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 2)),
          start_hours: '13:00',
          end_hours: '14:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[4]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_1',
          title: 'D4 Session de Formation 1',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 3)),
          start_hours: '9:00',
          end_hours: '10:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[0]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_2',
          title: 'D4 Session de Formation 2',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 3)),
          start_hours: '10:00',
          end_hours: '11:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[1]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_3',
          title: 'D4 Session de Formation 3',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 3)),
          start_hours: '11:00',
          end_hours: '12:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[2]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_4',
          title: 'D4 Session de Formation 4',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 3)),
          start_hours: '12:00',
          end_hours: '13:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[3]),
      CollectiveTrainingSession(
          collective_training_session_id: 'id_5',
          title: 'D4 Session de Formation 5',
          training_date: DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .add(const Duration(days: 3)),
          start_hours: '13:00',
          end_hours: '14:00',
          nb_place: 20,
          nb_subscription: 0,
          workout: workouts[4]),
    ];
  }

  late List<ExcerciseData> exercises_data;
  late List<ExerciseTraining> exercises_training;
  late List<TrainingCircuit> training_circuits;
  late List<Workout> workouts;
  late List<CollectiveTrainingSession> collectiveTrainingList;

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
}
