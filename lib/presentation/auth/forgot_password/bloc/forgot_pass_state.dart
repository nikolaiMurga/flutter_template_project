part of 'forgot_pass_cubit.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();
}

class ForgotPassInitial extends ForgotPassState {
  @override
  List<Object> get props => [];
}

class ResetPasswordProcessing extends ForgotPassState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordSucceed extends ForgotPassState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordFailed extends ForgotPassState {
  final String error;

  const ResetPasswordFailed(this.error);

  @override
  List<Object?> get props => [error];
}
