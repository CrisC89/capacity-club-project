import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_profile_page_event.dart';
part 'user_profile_page_state.dart';

class UserProfilePageBloc extends Bloc<UserProfilePageEvent, UserProfilePageState> {
  UserProfilePageBloc() : super(UserProfilePageInitial()) {
    on<UserProfilePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
