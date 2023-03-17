import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/settings/bloc/settings_cubit.dart';
import 'package:flutter_template_project/presentation/settings/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsScreen({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => locator<SettingsCubit>(), child: SettingsWidget(onPressed: onPressed));
  }
}
