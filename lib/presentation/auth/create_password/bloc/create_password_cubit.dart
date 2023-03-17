import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'create_password_state.dart';

@injectable
class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  final AuthRepo _authRepo;

  CreatePasswordCubit(this._authRepo) : super(CreatePasswordInitial());

  Future<void> createNewPassword({
    required String email,
    required String verificationCode,
    required String password,
    required String confirmation,
  }) async {
    try {
      emit(CreatePasswordProcessing());
      await _authRepo.createNewPassword(email: email, verificationCode: verificationCode, password: password, confirmation: confirmation);
      emit(CreatePasswordSucceed());
    } catch (e) {
      emit(CreatePasswordFailed(e.toString()));
    }
  }
}
