import 'package:flutter/material.dart';
import 'package:flutter_template_project/presentation/onboarding/steps/first_step_widget.dart';
import 'package:flutter_template_project/presentation/onboarding/steps/second_step_widget.dart';
import 'package:flutter_template_project/presentation/onboarding/steps/third_step_widget.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Widget> pages = [const FirstStepWidget(), const SecondStepWidget(), const ThirdStepWidget()];
  final controller = PageController();
  int currentPage = 0;
  double width = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(controller: controller, children: pages),
      ),
      bottomSheet: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage != 0) SizedBox(width: width, child: _changePage(isBack: true, increment: -1)) else SizedBox(width: width),
            SizedBox(width: width, child: Center(child: SmoothPageIndicator(count: 3, controller: controller))),
            if (currentPage != 2) SizedBox(width: width, child: _changePage(isBack: false, increment: 1)) else SizedBox(width: width),
          ],
        ),
      ),
    );
  }

  Widget _changePage({required bool isBack, required int increment}) {
    return TextButton(
        onPressed: () {
          if (isBack) {
            controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
          } else {
            controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
          }
          setState(() => currentPage += increment);
        },
        child: Text(isBack ? AppStrings.previous : AppStrings.next));
  }
}
