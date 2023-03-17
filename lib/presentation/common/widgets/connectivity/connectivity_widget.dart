import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget child;
  final bool connectionLost;

  const ConnectivityWidget({required this.child, required this.connectionLost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = [child];
    if (connectionLost) widgets.add(const _ConnectivityBar());
    return Scaffold(body: Stack(children: widgets));
  }
}

class _ConnectivityBar extends StatelessWidget {
  const _ConnectivityBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: AppColors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, color: AppColors.white, size: 20),
              const SizedBox(width: 10),
              Text(AppStrings.connectionLost.tr(), style: AppStyles.boldWhite18),
            ],
          ),
        ),
      ),
    );
  }
}
