import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_training_page_event.dart';
part 'home_training_page_state.dart';

class HomeTrainingPageBloc extends Bloc<HomeTrainingPageEvent, HomeTrainingPageState> {
  HomeTrainingPageBloc() : super(HomeTrainingPageInitial()) {
    on<HomeTrainingPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
