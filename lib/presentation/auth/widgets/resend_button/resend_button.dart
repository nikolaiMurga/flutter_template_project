import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/presentation/common/widgets/transparent_button.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:sprintf/sprintf.dart';

import 'bloc/resend_button_cubit.dart';

class ResendButton extends StatefulWidget {
  final ResendButtonCubit cubit;
  final VoidCallback onPressed;

  const ResendButton({required this.cubit, required this.onPressed, Key? key}) : super(key: key);

  @override
  _ResendButtonState createState() => _ResendButtonState();
}

class _ResendButtonState extends State<ResendButton> {
  Timer? _timer;

  bool get _codeWasResent => _timerNotifier.value != 60;
  final _timerNotifier = ValueNotifier(60);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendButtonCubit, ResendButtonState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is StartTimer) _startTimer();
      },
      child: ValueListenableBuilder(
        valueListenable: _timerNotifier,
        builder: (context, value, child) => TransparentButton(
          title: _codeWasResent ? sprintf(AppStrings.resendAfter.tr(), [value]) : AppStrings.resend.tr(),
          onPressed: _codeWasResent ? null : widget.onPressed,
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timerNotifier.value == 0) {
        timer.cancel();
        _timerNotifier.value = 60;
      } else {
        _timerNotifier.value--;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
