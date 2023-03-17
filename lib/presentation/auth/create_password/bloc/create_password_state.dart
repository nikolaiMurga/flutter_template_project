part of 'create_password_cubit.dart';

abstract class CreatePasswordState extends Equatable {
  const CreatePasswordState();
}

class CreatePasswordInitial extends CreatePasswordState {
  @override
  List<Object> get props => [];
}

class CreatePasswordProcessing extends CreatePasswordState {
  @override
  List<Object?> get props => [];
}

class CreatePasswordSucceed extends CreatePasswordState {
  @override
  List<Object?> get props => [];
}

class CreatePasswordFailed extends CreatePasswordState {
  final String error;

  const CreatePasswordFailed(this.error);

  @override
  List<Object?> get props => throw [error];
}
