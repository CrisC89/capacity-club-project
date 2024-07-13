import 'package:capacity_club_mobile_app/domain-features/core/widget/youtube-video/bloc/youtube_video_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatelessWidget {
  final String videoUrl;

  const YoutubeVideoPlayer({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          YoutubeVideoBloc()..add(LoadYoutubeVideoEvent(videoUrl)),
      child: const YoutubeVideoPlayerView(),
    );
  }
}

class YoutubeVideoPlayerView extends StatelessWidget {
  const YoutubeVideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video Player'),
      ),
      body: BlocBuilder<YoutubeVideoBloc, YoutubeVideoState>(
        builder: (context, state) {
          if (state is YoutubeVideoInitial || state is YoutubeVideoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is YoutubeVideoLoaded) {
            return LayoutBuilder(builder: (context, constraints) {
              double videoHeight = constraints.maxHeight / 3;
              double videoWidth = constraints.maxWidth * 0.6;
              return Center(
                  child: Container(
                width: videoWidth,
                height: videoHeight,
                child: YoutubePlayer(
                  controller: state.controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                ),
              ));
            });
          } else if (state is YoutubeVideoError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
