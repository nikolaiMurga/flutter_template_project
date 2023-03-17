import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/presentation/root/bloc/root_cubit.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RootCubit, RootState>(
      listener: (context, state) {
        if (state is GotoLoginPage) context.replaceRoute(const LoginScreen());
        if (state is GotoHomePage) context.replaceRoute(const HomeScreen());
      },
      child: const Scaffold(),
    );
  }
}
