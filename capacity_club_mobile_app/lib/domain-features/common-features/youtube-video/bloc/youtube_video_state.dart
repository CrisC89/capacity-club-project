part of 'youtube_video_bloc.dart';

@immutable
sealed class YoutubeVideoState {}

final class YoutubeVideoInitial extends YoutubeVideoState {}

class YoutubeVideoLoading extends YoutubeVideoState {}

class YoutubeVideoLoaded extends YoutubeVideoState {
  final YoutubePlayerController controller;

  YoutubeVideoLoaded(this.controller);

  @override
  List<Object> get props => [controller];
}

class YoutubeVideoError extends YoutubeVideoState {
  final String message;

  YoutubeVideoError(this.message);

  @override
  List<Object> get props => [message];
}
