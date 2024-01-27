import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_navigation_event.dart';
part 'dashboard_navigation_state.dart';

class DashboardNavigationBloc extends Bloc<DashboardNavigationEvent, DashboardNavigationState> {
  DashboardNavigationBloc() : super(DashboardNavigationInitial()) {
    on<DashboardNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
