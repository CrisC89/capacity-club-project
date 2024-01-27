import 'package:capacity_club_mobile_app/core/model/failure.dart';
import 'package:capacity_club_mobile_app/features/core/module/workout/domain/entity/workout.entity.dart';
import 'package:either_dart/either.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, Workout>> getWorkoutById(String workout_id);
}
