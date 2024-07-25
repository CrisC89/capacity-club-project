part of 'setting_page_bloc.dart';

@immutable
sealed class SettingPageEvent extends Equatable {
  const SettingPageEvent();
  @override
  List<Object?> get props => [];
}

final class SettingPageInitEvent extends SettingPageEvent {}
