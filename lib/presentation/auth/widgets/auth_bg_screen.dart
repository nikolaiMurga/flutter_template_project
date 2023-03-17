import 'package:flutter/material.dart';

class AuthBgScreen extends StatelessWidget {
  final bool splash;
  final Widget child;
  final bool fadeIn;
  final bool backButton;

  const AuthBgScreen({required this.child, this.fadeIn = false, this.backButton = false, this.splash = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SafeArea(
          top: !splash,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (backButton) SizedBox(height: 50, child: _backButton(context)),
              Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 50), child: child))
            ],
          ),
        ),
      ]),
    );
  }

  Widget _backButton(BuildContext context) => IconButton(onPressed: () => Navigator.of(context).pop, icon: const Icon(Icons.arrow_back));
}
