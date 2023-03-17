import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/common/widgets/connectivity/bloc/connectivity_cubit.dart';
import 'package:flutter_template_project/presentation/home/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => locator<ConnectivityCubit>()..checkConnectivity(), child: const HomeWidget());
  }
}
