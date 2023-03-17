import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const TransparentButton({required this.title, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(4),
      onPressed: onPressed,
      child: Text(title, style: AppStyles.mediumBlue14, textAlign: TextAlign.center),
    );
  }
}
