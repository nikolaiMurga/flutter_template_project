import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/presentation/auth/forgot_password/bloc/forgot_pass_cubit.dart';
import 'package:flutter_template_project/presentation/auth/widgets/auth_bg_screen.dart';
import 'package:flutter_template_project/presentation/auth/widgets/email_field.dart';
import 'package:flutter_template_project/presentation/common/helpers/toast_mixin.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_button.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_loading_overlay.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/utils/debug_constants.dart';

class ForgotPassWidget extends StatelessWidget with ToastMixin {
  ForgotPassWidget({Key? key}) : super(key: key);

  final _emailController = TextEditingController(text: kDebugMode ? DebugConst.email : '');
  final _emailValidationEnabled = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {
        if (state is ResetPasswordSucceed) {
          context.pushRoute(const HomeScreen());
        } else if (state is ResetPasswordFailed) {
          showToast(state.error);
        }
      },
      builder: (context, state) => AuthBgScreen(
        backButton: true,
        child: AppLoadingOverlay(
          isLoading: state is ResetPasswordProcessing,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: Column(
                children: [
                  const Spacer(flex: 70),
                  Text(AppStrings.forgotPassword.tr(), style: AppStyles.boldBlack24),
                  const Spacer(flex: 106),
                  Text(AppStrings.forgotPassDescription.tr(), style: AppStyles.regularBlack18, textAlign: TextAlign.center),
                  const SizedBox(height: 38),
                  _emailField,
                  const SizedBox(height: 30),
                  AppButton(title: AppStrings.confirm.tr(), onPressed: () => _onSendPressed(context)),
                  const Spacer(flex: 196),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _emailField => Form(
        key: _formKey,
        child: EmailField(controller: _emailController, validationEnabled: _emailValidationEnabled),
      );

  void _onSendPressed(BuildContext context) {
    _emailValidationEnabled.value = true;
    if (_formKey.currentState?.validate() == true) {
      context.pushRoute(const HomeScreen());
      context.read<ForgotPassCubit>().resetPassword(email: _emailController.text);
    }
  }
}
