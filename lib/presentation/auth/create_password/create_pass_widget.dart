import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/presentation/auth/widgets/auth_bg_screen.dart';
import 'package:flutter_template_project/presentation/auth/widgets/password_field.dart';
import 'package:flutter_template_project/presentation/common/helpers/toast_mixin.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_button.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_loading_overlay.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

import 'bloc/create_password_cubit.dart';

class CreatePassWidget extends StatelessWidget with ToastMixin {
  final String email;
  final String code;
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _codeValidationEnabled = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey();

  CreatePassWidget({required this.email, required this.code, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePasswordCubit, CreatePasswordState>(
      listener: (context, state) {
        if (state is CreatePasswordSucceed) {
          //TODO: insert needed logic when it will be
        } else if (state is CreatePasswordFailed) {
          showToast(AppStrings.incorrectCode.tr());
        }
      },
      builder: (context, state) => AuthBgScreen(
        backButton: true,
        child: AppLoadingOverlay(
          isLoading: state is CreatePasswordProcessing,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: Column(
                children: [
                  const Spacer(flex: 70),
                  Text(AppStrings.createPassword.tr(), style: AppStyles.boldBlack24),
                  const Spacer(flex: 92),
                  _passwordFields,
                  const SizedBox(height: 84),
                  AppButton(title: AppStrings.confirm.tr(), onPressed: () => _onConfirmPressed(context)),
                  const Spacer(flex: 196),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _passwordFields => Form(
        key: _formKey,
        child: Column(children: [_passwordField, const SizedBox(height: 20), _confirmPasswordField]),
      );

  Widget get _passwordField => PasswordField(
        controller: _passController,
        validationEnabled: _codeValidationEnabled,
        type: PassFieldType.create,
      );

  Widget get _confirmPasswordField => PasswordField(
        controller: _confirmPassController,
        validationEnabled: _codeValidationEnabled,
        type: PassFieldType.confirm,
        matchingPassController: _passController,
      );

  void _onConfirmPressed(BuildContext context) {
    _codeValidationEnabled.value = true;
    if (_formKey.currentState?.validate() == true) {
      context.read<CreatePasswordCubit>().createNewPassword(
            email: email,
            verificationCode: code,
            password: _passController.text,
            confirmation: _confirmPassController.text,
          );
    }
  }
}
