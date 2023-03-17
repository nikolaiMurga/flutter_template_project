import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

enum ButtonType { white, blue }

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final ButtonType type;

  const AppButton({required this.title, required this.onPressed, this.type = ButtonType.blue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: _overlayColor,
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(_color.withOpacity(1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
      onPressed: onPressed,
      child: Text(title, style: _style),
    );
  }

  MaterialStateProperty<Color>? get _overlayColor {
    switch (type) {
      case ButtonType.white:
        return MaterialStateProperty.all<Color>(AppColors.darkGray.withOpacity(0.1));
      case ButtonType.blue:
        return null;
    }
  }

  Color get _color {
    switch (type) {
      case ButtonType.white:
        return AppColors.white;
      case ButtonType.blue:
        return AppColors.blue;
    }
  }

  TextStyle get _style {
    switch (type) {
      case ButtonType.white:
        return AppStyles.boldBlue18;
      case ButtonType.blue:
        return AppStyles.boldWhite18;
    }
  }
}
