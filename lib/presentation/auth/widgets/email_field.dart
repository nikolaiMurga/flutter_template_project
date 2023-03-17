import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/decorations.dart';
import 'package:flutter_template_project/utils/extensions.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> validationEnabled;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focus;

  const EmailField({
    required this.controller,
    required this.validationEnabled,
    this.onFieldSubmitted,
    this.focus,
    Key? key,
  }) : super(key: key);

  @override
  State<EmailField> createState() => EmailFieldState();
}

class EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    //TODO: add autocorrect: false
    return TextFormField(
      textInputAction: TextInputAction.next,
      focusNode: widget.focus,
      autovalidateMode: AutovalidateMode.always,
      controller: widget.controller,
      cursorColor: AppColors.black,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: AppDecorations.textFieldDecoration.copyWith(hintText: AppStrings.email.tr()),
      validator: _validator,
      onChanged: (text) {
        if (widget.validationEnabled.value == true) widget.validationEnabled.value = false;
      },
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  String? _validator(String? value) {
    if (!widget.validationEnabled.value) {
      return null;
    } else {
      if (value == null || value.isEmpty) {
        return AppStrings.emptyEmail.tr();
      } else if (!value.isEmail()) {
        return AppStrings.incorrectEmail.tr();
      }
      return null;
    }
  }
}
