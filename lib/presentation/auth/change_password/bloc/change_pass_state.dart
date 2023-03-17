part of 'change_pass_cubit.dart';

abstract class ChangePassState extends Equatable {
  const ChangePassState();
}

class ChangePassInitial extends ChangePassState {
  @override
  List<Object> get props => [];
}

class ChangePasswordProcessing extends ChangePassState {
  @override
  List<Object?> get props => [];
}

class ChangePasswordSucceed extends ChangePassState {
  @override
  List<Object?> get props => [];
}

class ChangePasswordFailed extends ChangePassState {
  final String error;

  const ChangePasswordFailed(this.error);

  @override
  List<Object?> get props => [error];
}
