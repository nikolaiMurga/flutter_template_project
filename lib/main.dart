import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/data/db/persistence_helper.dart';
import 'package:flutter_template_project/resources/app_constants.dart';
import 'package:flutter_template_project/resources/app_strings.dart';

import 'app/router.gr.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await PersistenceHelper.initHive();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [AppConstants.english, AppConstants.russian],
      path: AppStrings.localizationPath,
      fallbackLocale: AppConstants.english,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppStrings.title.tr(),
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}