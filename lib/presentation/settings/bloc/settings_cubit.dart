import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/data/repo/auth/auth_local_repo.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final AuthLocalRepo _authLocalRepo;
  SettingsCubit(this._authLocalRepo) : super(SettingsInitialState());

  Future<void> logout() async {
    try{
      await _authLocalRepo.clearAll();
      emit(SettingsLogoutState());
    } catch (e){
      emit(SettingsErrorState(e.toString()));
    }
  }
}
