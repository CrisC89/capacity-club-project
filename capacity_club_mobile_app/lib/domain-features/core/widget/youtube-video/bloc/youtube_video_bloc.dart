import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'youtube_video_event.dart';
part 'youtube_video_state.dart';

class YoutubeVideoBloc extends Bloc<YoutubeVideoEvent, YoutubeVideoState> {
  YoutubeVideoBloc() : super(YoutubeVideoInitial()) {
    on<LoadYoutubeVideoEvent>((event, emit) async {
      emit(YoutubeVideoLoading());
      try {
        final controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(event.videoUrl)!,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );
        emit(YoutubeVideoLoaded(controller));
      } catch (e) {
        emit(YoutubeVideoError('Failed to load video'));
      }
    });
  }
}
