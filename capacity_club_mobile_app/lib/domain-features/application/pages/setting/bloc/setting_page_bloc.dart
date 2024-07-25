import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_page_event.dart';
part 'setting_page_state.dart';

class SettingPageBloc extends Bloc<SettingPageEvent, SettingPageState> {
  SettingPageBloc() : super(SettingPageInitial()) {
    on<SettingPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
