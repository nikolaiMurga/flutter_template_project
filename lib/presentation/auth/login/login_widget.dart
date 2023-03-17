import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/presentation/auth/widgets/auth_bg_screen.dart';
import 'package:flutter_template_project/presentation/auth/widgets/email_field.dart';
import 'package:flutter_template_project/presentation/auth/widgets/password_field.dart';
import 'package:flutter_template_project/presentation/common/helpers/toast_mixin.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_button.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_loading_overlay.dart';
import 'package:flutter_template_project/presentation/common/widgets/transparent_button.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/utils/debug_constants.dart';

import 'bloc/login_cubit.dart';

class LoginWidget extends StatelessWidget with ToastMixin {
  LoginWidget({Key? key}) : super(key: key);
  final _emailController = TextEditingController(text: kDebugMode ? DebugConst.email : '');
  final _passwordController = TextEditingController(text: kDebugMode ? DebugConst.password : '');
  final _emailValidationEnabled = ValueNotifier(false);
  final _passwordValidationEnabled = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucceed) {
          context.replaceRoute(const HomeScreen());
        } else if (state is LoginFailed) {
          showToast(state.error);
        }
      },
      builder: (context, state) => AuthBgScreen(
        backButton: false,
        child: AppLoadingOverlay(
          isLoading: state is LoginProcessing,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: Column(
                children: [
                  const Spacer(flex: 70),
                  Text(AppStrings.login.tr(), style: AppStyles.boldBlack24),
                  const Spacer(flex: 92),
                  _textFields(context),
                  const SizedBox(height: 10),
                  const SizedBox(height: 30),
                  AppButton(title: AppStrings.login.tr(), onPressed: () => _onLoginPressed(context)),
                  const Spacer(flex: 110),
                  const Spacer(flex: 70),
                  TransparentButton(title: AppStrings.forgotPassword.tr(), onPressed: () => context.pushRoute(const ForgotPassScreen())),
                  const SizedBox(height: 30),
                  TransparentButton(title: AppStrings.changePassword.tr(), onPressed: () => context.pushRoute(const ChangePassScreen())),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _textFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailField(
            controller: _emailController,
            validationEnabled: _emailValidationEnabled,
            onFieldSubmitted: (v) => _passwordFocus.requestFocus(),
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: _passwordController,
            validationEnabled: _passwordValidationEnabled,
            focus: _passwordFocus,
            onFieldSubmitted: (v) {},
          ),
        ],
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    _emailValidationEnabled.value = true;
    _passwordValidationEnabled.value = true;
    final valid = _formKey.currentState?.validate();
    if (valid == true) {
      context.read<LoginCubit>().loginWithEmail(email: _emailController.text, password: _passwordController.text);
    }
  }
}
