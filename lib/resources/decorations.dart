import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

//TODO: remove unused
class AppDecorations {
  static final borderRadius10 = BorderRadius.circular(10.0);

  static final textFieldBorder = OutlineInputBorder(
    borderRadius: AppDecorations.borderRadius10,
    borderSide: const BorderSide(color: AppColors.gray),
  );

  static final textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: AppColors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    hintStyle: AppStyles.regularHint16,
    focusedBorder: AppDecorations.textFieldBorder,
    border: AppDecorations.textFieldBorder,
    enabledBorder: AppDecorations.textFieldBorder,
  );

  static const boxDecor = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  );

  static final feedButtonsDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.gray),
    color: AppColors.white,
  );

  static final libraryBoxImage = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    color: AppColors.black,
  );

  static const rad10 = Radius.circular(10);
  static const rad5 = Radius.circular(5);
}
