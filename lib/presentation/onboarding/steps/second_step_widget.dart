import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/resources/images_paths.dart';

class SecondStepWidget extends StatelessWidget {
  const SecondStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(AppStrings.secondStep, style: AppStyles.alphaHeaders),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text(AppStrings.lorem, style: AppStyles.regularBlack18)),
              const SizedBox(height: 120),
              SizedBox(height: 320, child: Image.network(ImagesPaths.secondDog))
            ],
          ),
        ),
      ),
    );
  }
}
