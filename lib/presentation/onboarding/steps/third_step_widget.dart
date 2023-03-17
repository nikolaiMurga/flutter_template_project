import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/resources/images_paths.dart';

class ThirdStepWidget extends StatelessWidget {
  const ThirdStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                AppStrings.thirdStep,
                style: AppStyles.alphaHeaders,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text(AppStrings.lorem, style: AppStyles.regularBlack18)),
              const SizedBox(height: 30),
              const SizedBox(height: 60),
              SizedBox(height: 300, child: Image.network(ImagesPaths.thirdDog)),
            ],
          ),
        ),
      ),
    );
  }
}
