import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/locator.dart';
import 'package:flutter_template_project/presentation/auth/forgot_password/forgot_pass_widget.dart';

import 'bloc/forgot_pass_cubit.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => locator<ForgotPassCubit>(), child: ForgotPassWidget());
  }
}
