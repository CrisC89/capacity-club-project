import 'package:capacity_club_mobile_app/domain-features/common-features/exercise-video-player/bloc/exercise_video_player_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class ExerciseVideoPlayer extends StatelessWidget {
  final String videoPath;

  ExerciseVideoPlayer({required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExerciseVideoPlayerBloc()
        ..add(ExerciseVideoPlayerLoadEvent(videoPath)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exercise Video Player'),
        ),
        body: BlocBuilder<ExerciseVideoPlayerBloc, ExerciseVideoPlayerState>(
          builder: (context, state) {
            if (state is ExerciseVideoPlayerLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ExerciseVideoPlayerLoaded ||
                state is ExerciseVideoPlayerPlaying ||
                state is ExerciseVideoPlayerPaused) {
              final controller = (state as dynamic).controller;
              return Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              );
            } else {
              return Center(child: Text('Press play to start the video'));
            }
          },
        ),
        floatingActionButton:
            BlocBuilder<ExerciseVideoPlayerBloc, ExerciseVideoPlayerState>(
          builder: (context, state) {
            if (state is ExerciseVideoPlayerPlaying) {
              return FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<ExerciseVideoPlayerBloc>(context)
                      .add(ExerciseVideoPlayerPauseEvent());
                },
                child: Icon(Icons.pause),
              );
            } else if (state is ExerciseVideoPlayerPaused ||
                state is ExerciseVideoPlayerLoaded) {
              return FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<ExerciseVideoPlayerBloc>(context)
                      .add(ExerciseVideoPlayerPlayEvent());
                },
                child: Icon(Icons.play_arrow),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
