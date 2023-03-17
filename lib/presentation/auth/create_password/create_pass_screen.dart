import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/auth/create_password/create_pass_widget.dart';

import 'bloc/create_password_cubit.dart';

class CreatePassScreen extends StatelessWidget {
  final String email;
  final String code;

  const CreatePassScreen({required this.email, required this.code, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => locator<CreatePasswordCubit>(), child: CreatePassWidget(email: email, code: code));
  }
}
