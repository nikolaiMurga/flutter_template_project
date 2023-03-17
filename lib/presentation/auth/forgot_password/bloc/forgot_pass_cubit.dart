import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'forgot_pass_state.dart';

@injectable
class ForgotPassCubit extends Cubit<ForgotPassState> {
  final AuthRepo _authRepo;

  ForgotPassCubit(this._authRepo) : super(ForgotPassInitial());

  Future<void> resetPassword({required String email}) async {
    try {
      emit(ResetPasswordProcessing());
      await _authRepo.resetPassword(email: email);
      emit(ResetPasswordSucceed());
    } catch (e) {
      emit(ResetPasswordFailed(e.toString()));
    }
  }
}
