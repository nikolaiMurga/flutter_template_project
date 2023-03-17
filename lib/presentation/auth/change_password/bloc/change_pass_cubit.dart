import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'change_pass_state.dart';

@injectable
class ChangePassCubit extends Cubit<ChangePassState> {
  final AuthRepo _authRepo;

  ChangePassCubit(this._authRepo) : super(ChangePassInitial());

  Future<void> changePassword({required String email}) async {
    try {
      emit(ChangePasswordProcessing());
      await _authRepo.changePassword(email: email);
      emit(ChangePasswordSucceed());
    } catch (e) {
      emit(ChangePasswordFailed(e.toString()));
    }
  }
}
