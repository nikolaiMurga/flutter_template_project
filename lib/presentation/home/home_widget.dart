import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/domain/repo/click_repo.dart';
import 'package:flutter_template_project/flavour_config.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_button.dart';
import 'package:flutter_template_project/presentation/common/widgets/connectivity/bloc/connectivity_cubit.dart';
import 'package:flutter_template_project/presentation/common/widgets/connectivity/connectivity_widget.dart';
import 'package:flutter_template_project/presentation/common/widgets/menu_drawer.dart';
import 'package:flutter_template_project/presentation/common/widgets/template_appbar.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:logger/logger.dart';
import 'package:sprintf/sprintf.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _counter = 0;
  final logger = Logger();
  final ClickRepo _clickRepo = locator<ClickRepo>();
  final flavour = Constants.getFlavour;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveClicks(_counter);
    });
  }

  void _saveClicks(int counter) {
    _clickRepo.saveClicks(clicks: counter);
  }

  void _log() {
    logger.d('Log message with 2 methods');
    logger.i('Info message');
    logger.w('Just a warning!');
    logger.e('Error! Something bad happened', 'Test Error');
    logger.v({'key': 5, 'value': 'something'});
    Logger(printer: SimplePrinter(colors: true)).v('boom');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(onPressed: () => setState(() {})),
      appBar: TemplateAppBar(
        color: flavour.getFlavourColor(),
        title: Text(sprintf(AppStrings.youLoaded.tr(), [flavour.getFlavourName(), AppStrings.app.tr()])),
      ),
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) => ConnectivityWidget(
          connectionLost: state is ConnectivityNone,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppStrings.title.tr()),
                const SizedBox(height: 50),
                Text(AppStrings.youPushed.tr()),
                const SizedBox(height: 20),
                Text('$_counter', style: AppStyles.regularBlack36),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: AppButton(title: AppStrings.goOnboardingPage.tr(), onPressed: () => context.pushRoute(const OnboardingScreen())),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: AppButton(title: AppStrings.goProfilePage.tr(), onPressed: () => context.pushRoute(const ProfileScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _log();
        },
        tooltip: AppStrings.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
