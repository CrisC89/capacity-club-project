import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeState()) {
    on<NavigateToHomePage>((event, emit) => emit(HomeState()));
    on<NavigateToPersonalTrainingPage>(
        (event, emit) => emit(PersonalTrainingState()));
    on<NavigateToUserProfilePage>((event, emit) => emit(UserProfileState()));
    on<NavigateToSettingPage>((event, emit) => emit(SettingState()));
  }
}
