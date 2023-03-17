import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/decorations.dart';

enum PassFieldType { regular, create, confirm }

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? matchingPassController;
  final ValueNotifier<bool> validationEnabled;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focus;
  final PassFieldType type;

  const PasswordField({
    required this.controller,
    required this.validationEnabled,
    this.type = PassFieldType.regular,
    this.onFieldSubmitted,
    this.focus,
    this.matchingPassController,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      textInputAction: TextInputAction.done,
      focusNode: widget.focus,
      autovalidateMode: AutovalidateMode.always,
      controller: widget.controller,
      cursorColor: AppColors.black,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: AppDecorations.textFieldDecoration.copyWith(hintText: _hint, suffixIcon: _obscureButton),
      validator: _validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: (text) {
        if (widget.validationEnabled.value == true) widget.validationEnabled.value = false;
      },
    );
  }

  Widget get _obscureButton => IconButton(
        splashRadius: 1,
        color: AppColors.lightGray2,
        icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
        onPressed: () => setState(() => _obscure = !_obscure),
      );

  String get _hint {
    switch (widget.type) {
      case PassFieldType.regular:
        return AppStrings.password.tr();
      case PassFieldType.create:
        return AppStrings.newPassword.tr();
      case PassFieldType.confirm:
        return AppStrings.confirmPassword.tr();
    }
  }

  String? _validator(String? value) {
    if (!widget.validationEnabled.value) {
      return null;
    } else {
      if (value == null || value.isEmpty) {
        return AppStrings.emptyPassword.tr();
      } else if (value.length < 4) {
        return AppStrings.incorrectPassword.tr();
      } else if (widget.type == PassFieldType.confirm && widget.matchingPassController != null) {
        if (widget.matchingPassController!.text != widget.controller.text) {
          return AppStrings.passwordMismatch.tr();
        } else {
          return null;
        }
      }
      return null;
    }
  }
}
