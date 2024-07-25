import 'package:capacity_club_mobile_app/core/model/abstract/failure.dart';
import 'package:either_dart/either.dart';

import 'dart:async';

class IndoorTrainingMockRepository {
  final List<Map<String, dynamic>> workouts = List.generate(100, (index) {
    int totalSlots = (index % 10 == 0) ? 1 : 10 + (index % 20);
    return {
      'workoutName': 'Workout ${index + 1}',
      'date': '2024-06-${(index % 30) + 1}'.padLeft(10, '0'),
      'startTime': '${(index % 12) + 1}:00 ${(index % 2 == 0) ? 'AM' : 'PM'}',
      'endTime':
          '${((index + 1) % 12) + 1}:00 ${(index % 2 == 0) ? 'AM' : 'PM'}',
      'totalSlots': totalSlots,
      'registeredSlots': totalSlots == 1 ? 0 : (index % 15),
      'isUserRegistered': totalSlots == 1 ? false : (index % 3 == 0),
      'isCollective': totalSlots == 1,
    };
  });

  Future<Either<Failure, List<Map<String, dynamic>>>> getListWorkouts() async {
    await Future.delayed(Duration(seconds: 2));
    return Right(workouts.toList());
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> fetchFilteredWorkouts(
      String date, bool isCollective) async {
    await Future.delayed(Duration(seconds: 2));
    var filteredWorkouts = workouts
        .where((workout) =>
            workout['date'] == date && workout['isCollective'] == isCollective)
        .toList();
    return Right(filteredWorkouts);
  }
}
