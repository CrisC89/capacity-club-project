part of 'exercise_video_player_bloc.dart';

@immutable
sealed class ExerciseVideoPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExerciseVideoPlayerLoadEvent extends ExerciseVideoPlayerEvent {
  final String videoPath;

  ExerciseVideoPlayerLoadEvent(this.videoPath);

  @override
  List<Object?> get props => [videoPath];
}

class ExerciseVideoPlayerPlayEvent extends ExerciseVideoPlayerEvent {}

class ExerciseVideoPlayerPauseEvent extends ExerciseVideoPlayerEvent {}
