import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/data/repo/auth/auth_local_repo.dart';
import 'package:injectable/injectable.dart';

part 'root_state.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  final AuthLocalRepo _authLocalRepo;

  RootCubit(this._authLocalRepo) : super(RootInitial());

  void get setup async {
    try {
      final bool isLogin = await _authLocalRepo.readToken() != null;
      isLogin ? emit(GotoHomePage()) : emit(GotoLoginPage());
    } catch (e) {
      emit(RootErrorState());
    }
  }
}
