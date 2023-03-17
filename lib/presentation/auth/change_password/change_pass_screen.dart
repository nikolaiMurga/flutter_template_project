import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/auth/change_password/bloc/change_pass_cubit.dart';
import 'package:flutter_template_project/presentation/auth/change_password/change_pass_widget.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => locator<ChangePassCubit>(), child: ChangePassWidget());
  }
}
