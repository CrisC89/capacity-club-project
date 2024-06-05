part of 'exercise_video_player_bloc.dart';

@immutable
sealed class ExerciseVideoPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ExerciseVideoPlayerInitial extends ExerciseVideoPlayerState {}

class ExerciseVideoPlayerLoading extends ExerciseVideoPlayerState {}

class ExerciseVideoPlayerLoaded extends ExerciseVideoPlayerState {
  final VideoPlayerController controller;

  ExerciseVideoPlayerLoaded(this.controller);

  @override
  List<Object?> get props => [controller];
}

class ExerciseVideoPlayerPlaying extends ExerciseVideoPlayerState {
  final VideoPlayerController controller;

  ExerciseVideoPlayerPlaying(this.controller);

  @override
  List<Object?> get props => [controller];
}

class ExerciseVideoPlayerPaused extends ExerciseVideoPlayerState {
  final VideoPlayerController controller;

  ExerciseVideoPlayerPaused(this.controller);

  @override
  List<Object?> get props => [controller];
}
