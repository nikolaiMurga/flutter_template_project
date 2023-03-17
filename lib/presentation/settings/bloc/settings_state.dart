part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable{}

class SettingsInitialState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsLogoutState extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsErrorState extends SettingsState {
  final String error;

  SettingsErrorState(this.error);

  @override
  List<Object?> get props => throw [error];
}