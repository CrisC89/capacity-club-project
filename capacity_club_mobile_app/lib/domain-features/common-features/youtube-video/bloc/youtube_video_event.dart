part of 'youtube_video_bloc.dart';

@immutable
sealed class YoutubeVideoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadYoutubeVideoEvent extends YoutubeVideoEvent {
  final String videoUrl;

  LoadYoutubeVideoEvent(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}
