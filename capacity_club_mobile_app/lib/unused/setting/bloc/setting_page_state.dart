part of 'setting_page_bloc.dart';

@immutable
sealed class SettingPageState extends Equatable {
  const SettingPageState();
  @override
  List<Object?> get props => [];
}

final class SettingPageInitial extends SettingPageState {}

final class SettingPageLoadedState extends SettingPageState {}

final class SettingPageLoadingState extends SettingPageState {}

final class SettingPageErrorState extends SettingPageState {}
