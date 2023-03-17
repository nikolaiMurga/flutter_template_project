import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template_project/presentation/auth/change_password/change_pass_screen.dart';
import 'package:flutter_template_project/presentation/auth/create_password/create_pass_screen.dart';
import 'package:flutter_template_project/presentation/auth/forgot_password/forgot_pass_screen.dart';
import 'package:flutter_template_project/presentation/auth/login/login_screen.dart';
import 'package:flutter_template_project/presentation/home/home_screen.dart';
import 'package:flutter_template_project/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_template_project/presentation/profile/profile_screen.dart';
import 'package:flutter_template_project/presentation/root/root_screen.dart';
import 'package:flutter_template_project/presentation/language/language_screen.dart';
import 'package:flutter_template_project/presentation/settings/settings_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: RootScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ForgotPassScreen),
    AutoRoute(page: ChangePassScreen),
    AutoRoute(page: CreatePassScreen),
    AutoRoute(page: OnboardingScreen),
    AutoRoute(page: ProfileScreen),
    AutoRoute(page: SettingsScreen),
    AutoRoute(page: LanguageScreen),
  ],
)
class $AppRouter {}
