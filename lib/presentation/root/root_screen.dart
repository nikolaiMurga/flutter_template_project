import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/root/bloc/root_cubit.dart';
import 'package:flutter_template_project/presentation/root/root_widget.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=> locator<RootCubit>()..setup, child: const RootWidget());
  }
}
