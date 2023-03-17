// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repo/auth/auth_local_repo.dart' as _i10;
import '../data/repo/auth/auth_repo_impl.dart' as _i12;
import '../data/repo/click_repo/click_local_repo.dart' as _i3;
import '../data/repo/click_repo/click_repo_impl.dart' as _i5;
import '../data/repo/user/user_preferences.dart' as _i9;
import '../domain/repo/auth_repo.dart' as _i11;
import '../domain/repo/click_repo.dart' as _i4;
import '../presentation/auth/change_password/bloc/change_pass_cubit.dart'
    as _i13;
import '../presentation/auth/create_password/bloc/create_password_cubit.dart'
    as _i15;
import '../presentation/auth/forgot_password/bloc/forgot_pass_cubit.dart'
    as _i16;
import '../presentation/auth/login/bloc/login_cubit.dart' as _i17;
import '../presentation/auth/widgets/resend_button/bloc/resend_button_cubit.dart'
    as _i8;
import '../presentation/common/widgets/connectivity/bloc/connectivity_cubit.dart'
    as _i14;
import '../presentation/profile/bloc/profile_cubit.dart' as _i7;
import '../presentation/root/bloc/root_cubit.dart' as _i18;
import '../presentation/settings/bloc/settings_cubit.dart' as _i19;
import 'services/connectivity_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ClickLocalRepo>(() => _i3.ClickLocalRepo());
  gh.singleton<_i4.ClickRepo>(_i5.ClickRepoImpl(get<_i3.ClickLocalRepo>()));
  gh.factory<_i6.ConnectivityService>(() => _i6.ConnectivityService());
  gh.factory<_i7.ProfileCubit>(() => _i7.ProfileCubit());
  gh.factory<_i8.ResendButtonCubit>(() => _i8.ResendButtonCubit());
  gh.singleton<_i9.UserPreferences>(_i9.UserPreferences());
  gh.singleton<_i10.AuthLocalRepo>(
      _i10.AuthLocalRepo(get<_i9.UserPreferences>()));
  gh.singleton<_i11.AuthRepo>(_i12.AuthRepoImpl(get<_i10.AuthLocalRepo>()));
  gh.factory<_i13.ChangePassCubit>(
      () => _i13.ChangePassCubit(get<_i11.AuthRepo>()));
  gh.factory<_i14.ConnectivityCubit>(
      () => _i14.ConnectivityCubit(get<_i6.ConnectivityService>()));
  gh.factory<_i15.CreatePasswordCubit>(
      () => _i15.CreatePasswordCubit(get<_i11.AuthRepo>()));
  gh.factory<_i16.ForgotPassCubit>(
      () => _i16.ForgotPassCubit(get<_i11.AuthRepo>()));
  gh.factory<_i17.LoginCubit>(() => _i17.LoginCubit(get<_i11.AuthRepo>()));
  gh.factory<_i18.RootCubit>(() => _i18.RootCubit(get<_i10.AuthLocalRepo>()));
  gh.factory<_i19.SettingsCubit>(
      () => _i19.SettingsCubit(get<_i10.AuthLocalRepo>()));
  return get;
}
