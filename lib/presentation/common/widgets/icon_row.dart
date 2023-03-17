import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';

class IconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const IconRow({required this.icon, required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: AppColors.deepBlue, size: 25),
          const SizedBox(width: 20),
          Text(text, style: const TextStyle(color: AppColors.deepBlue)),
        ],
      ),
    );
  }
}
