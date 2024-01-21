import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'collective_training_session_event.dart';
part 'collective_training_session_state.dart';

class CollectiveTrainingSessionBloc extends Bloc<CollectiveTrainingSessionEvent, CollectiveTrainingSessionState> {
  CollectiveTrainingSessionBloc() : super(CollectiveTrainingSessionInitial()) {
    on<CollectiveTrainingSessionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
