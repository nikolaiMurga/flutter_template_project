part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileProcessing extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSucceed extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileFailed extends ProfileState {
  final String error;

  const ProfileFailed(this.error);

  @override
  List<Object> get props => [error];
}
