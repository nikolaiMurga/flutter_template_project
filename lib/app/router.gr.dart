// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../presentation/auth/change_password/change_pass_screen.dart' as _i5;
import '../presentation/auth/create_password/create_pass_screen.dart' as _i6;
import '../presentation/auth/forgot_password/forgot_pass_screen.dart' as _i4;
import '../presentation/auth/login/login_screen.dart' as _i2;
import '../presentation/home/home_screen.dart' as _i3;
import '../presentation/language/language_screen.dart' as _i10;
import '../presentation/onboarding/onboarding_screen.dart' as _i7;
import '../presentation/profile/profile_screen.dart' as _i8;
import '../presentation/root/root_screen.dart' as _i1;
import '../presentation/settings/settings_screen.dart' as _i9;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    RootScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RootScreen());
    },
    LoginScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    HomeScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    },
    ForgotPassScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgotPassScreen());
    },
    ChangePassScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ChangePassScreen());
    },
    CreatePassScreen.name: (routeData) {
      final args = routeData.argsAs<CreatePassScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CreatePassScreen(
              email: args.email, code: args.code, key: args.key));
    },
    OnboardingScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.OnboardingScreen());
    },
    ProfileScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileScreen());
    },
    SettingsScreen.name: (routeData) {
      final args = routeData.argsAs<SettingsScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SettingsScreen(onPressed: args.onPressed, key: args.key));
    },
    LanguageScreen.name: (routeData) {
      final args = routeData.argsAs<LanguageScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.LanguageScreen(locale: args.locale, key: args.key));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(RootScreen.name, path: '/'),
        _i11.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i11.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i11.RouteConfig(ForgotPassScreen.name, path: '/forgot-pass-screen'),
        _i11.RouteConfig(ChangePassScreen.name, path: '/change-pass-screen'),
        _i11.RouteConfig(CreatePassScreen.name, path: '/create-pass-screen'),
        _i11.RouteConfig(OnboardingScreen.name, path: '/onboarding-screen'),
        _i11.RouteConfig(ProfileScreen.name, path: '/profile-screen'),
        _i11.RouteConfig(SettingsScreen.name, path: '/settings-screen'),
        _i11.RouteConfig(LanguageScreen.name, path: '/language-screen')
      ];
}

/// generated route for
/// [_i1.RootScreen]
class RootScreen extends _i11.PageRouteInfo<void> {
  const RootScreen() : super(RootScreen.name, path: '/');

  static const String name = 'RootScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i11.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i11.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i4.ForgotPassScreen]
class ForgotPassScreen extends _i11.PageRouteInfo<void> {
  const ForgotPassScreen()
      : super(ForgotPassScreen.name, path: '/forgot-pass-screen');

  static const String name = 'ForgotPassScreen';
}

/// generated route for
/// [_i5.ChangePassScreen]
class ChangePassScreen extends _i11.PageRouteInfo<void> {
  const ChangePassScreen()
      : super(ChangePassScreen.name, path: '/change-pass-screen');

  static const String name = 'ChangePassScreen';
}

/// generated route for
/// [_i6.CreatePassScreen]
class CreatePassScreen extends _i11.PageRouteInfo<CreatePassScreenArgs> {
  CreatePassScreen({required String email, required String code, _i12.Key? key})
      : super(CreatePassScreen.name,
            path: '/create-pass-screen',
            args: CreatePassScreenArgs(email: email, code: code, key: key));

  static const String name = 'CreatePassScreen';
}

class CreatePassScreenArgs {
  const CreatePassScreenArgs(
      {required this.email, required this.code, this.key});

  final String email;

  final String code;

  final _i12.Key? key;

  @override
  String toString() {
    return 'CreatePassScreenArgs{email: $email, code: $code, key: $key}';
  }
}

/// generated route for
/// [_i7.OnboardingScreen]
class OnboardingScreen extends _i11.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(OnboardingScreen.name, path: '/onboarding-screen');

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileScreen extends _i11.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile-screen');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i9.SettingsScreen]
class SettingsScreen extends _i11.PageRouteInfo<SettingsScreenArgs> {
  SettingsScreen({required void Function() onPressed, _i12.Key? key})
      : super(SettingsScreen.name,
            path: '/settings-screen',
            args: SettingsScreenArgs(onPressed: onPressed, key: key));

  static const String name = 'SettingsScreen';
}

class SettingsScreenArgs {
  const SettingsScreenArgs({required this.onPressed, this.key});

  final void Function() onPressed;

  final _i12.Key? key;

  @override
  String toString() {
    return 'SettingsScreenArgs{onPressed: $onPressed, key: $key}';
  }
}

/// generated route for
/// [_i10.LanguageScreen]
class LanguageScreen extends _i11.PageRouteInfo<LanguageScreenArgs> {
  LanguageScreen({required _i12.Locale locale, _i12.Key? key})
      : super(LanguageScreen.name,
            path: '/language-screen',
            args: LanguageScreenArgs(locale: locale, key: key));

  static const String name = 'LanguageScreen';
}

class LanguageScreenArgs {
  const LanguageScreenArgs({required this.locale, this.key});

  final _i12.Locale locale;

  final _i12.Key? key;

  @override
  String toString() {
    return 'LanguageScreenArgs{locale: $locale, key: $key}';
  }
}
