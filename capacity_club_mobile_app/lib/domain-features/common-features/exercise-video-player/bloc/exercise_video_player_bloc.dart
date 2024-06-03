import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'exercise_video_player_event.dart';
part 'exercise_video_player_state.dart';

class ExerciseVideoPlayerBloc
    extends Bloc<ExerciseVideoPlayerEvent, ExerciseVideoPlayerState> {
  VideoPlayerController? _controller;

  ExerciseVideoPlayerBloc() : super(ExerciseVideoPlayerInitial()) {
    on<ExerciseVideoPlayerLoadEvent>(_onLoad);
    on<ExerciseVideoPlayerPlayEvent>(_onPlay);
    on<ExerciseVideoPlayerPauseEvent>(_onPause);
  }

  Future<void> _onLoad(ExerciseVideoPlayerLoadEvent event,
      Emitter<ExerciseVideoPlayerState> emit) async {
    emit(ExerciseVideoPlayerLoading());
    _controller = VideoPlayerController.asset(event.videoPath);
    try {
      await _controller!.initialize();
      _controller!.setLooping(true);
      emit(ExerciseVideoPlayerLoaded(_controller!));
    } catch (e) {
      emit(ExerciseVideoPlayerInitial()); // Revert to initial state on error
    }
  }

  void _onPlay(ExerciseVideoPlayerPlayEvent event,
      Emitter<ExerciseVideoPlayerState> emit) {
    if (_controller != null) {
      _controller!.play();
      emit(ExerciseVideoPlayerPlaying(_controller!));
    }
  }

  void _onPause(ExerciseVideoPlayerPauseEvent event,
      Emitter<ExerciseVideoPlayerState> emit) {
    if (_controller != null) {
      _controller!.pause();
      emit(ExerciseVideoPlayerPaused(_controller!));
    }
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
