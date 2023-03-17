// import 'package:flutter/material.dart';
// import 'package:flutter_template_project/resources/decorations.dart';
// import '../../../resources/app_colors.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class CodeField extends StatefulWidget {
//   final TextEditingController controller;
//   final ValueNotifier<bool> validationEnabled;
//   final ValueChanged<String>? onFieldSubmitted;
//   final FocusNode? focus;
//
//   const CodeField({
//     required this.controller,
//     required this.validationEnabled,
//     this.onFieldSubmitted,
//     this.focus,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CodeField> createState() => CodeFieldState();
// }
//
// class CodeFieldState extends State<CodeField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       textInputAction: TextInputAction.done,
//       focusNode: widget.focus,
//       autovalidateMode: AutovalidateMode.always,
//       controller: widget.controller,
//       cursorColor: AppColors.black,
//       decoration: AppDecorations.textFieldDecoration.copyWith(hintText: 'veri'
//           'ficationCode'.tr()),
//       validator: _validator,
//       onChanged: (text) {
//         if (widget.validationEnabled.value == true) widget.validationEnabled.value = false;
//       },
//       onFieldSubmitted: widget.onFieldSubmitted,
//     );
//   }
//
//   String? _validator(String? value) {
//     if (!widget.validationEnabled.value) {
//       return null;
//     } else {
//       if (value == null || value.isEmpty) {
//         return tr!.emptyCode;
//       } else if (value.length < 4) {
//         return tr!.incorrectCode;
//       }
//       return null;
//     }
//   }
// }
