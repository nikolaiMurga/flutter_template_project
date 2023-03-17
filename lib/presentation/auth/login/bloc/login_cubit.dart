import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;

  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> loginWithEmail({required String email, required String password}) async {
    bool hasNextScreen;
    try {
      emit(LoginProcessing());
      hasNextScreen = await _authRepo.loginWithEmail(email: email, password: password);
      if (hasNextScreen) emit(LoginSucceed());
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
