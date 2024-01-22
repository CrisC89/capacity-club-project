import 'package:bloc/bloc.dart';
import 'package:capacity_club_mobile_app/core/contract/usecase.dart';
import 'package:capacity_club_mobile_app/features/user/domain/entity/member.entity.dart';
import 'package:capacity_club_mobile_app/features/user/domain/usecase/me.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc({required this.getUser, UserState? initialState})
      : super(initialState ?? UserStateLoading()) {
    on<UserRequestedEvent>((event, emit) async {
      emit(UserStateLoading());
      try {
        final user = await getUser.call(NoParams());

        if (user.isLeft) {
          emit(UserStateError(message: 'Not found'));
        } else {
          emit(UserStateLoaded(user: user.right));
        }
      } on Exception {
        emit(UserStateError(message: 'Other error'));
      }
    });
  }

  /*
  emit(AdviceStateLoading());
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
              (advice) => emit(AdviceStateLoaded(advice: advice.advice)),
              (failure) => emit(AdviceStateError(message: _mapFailureToMessage(failure))));

   });

   String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default :
        return generalFailureMessage;
    }
  */
}
