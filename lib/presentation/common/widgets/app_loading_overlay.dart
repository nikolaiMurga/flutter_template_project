import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class AppLoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const AppLoadingOverlay(
      {required this.child, required this.isLoading, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading, color: Colors.transparent, child: child);
  }
}
