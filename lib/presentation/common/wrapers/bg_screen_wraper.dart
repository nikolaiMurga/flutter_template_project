import 'package:flutter/material.dart';

class BgScreenWrapper extends StatefulWidget {
  final Widget child;
  final String background;

  const BgScreenWrapper(
      {required this.child, required this.background, Key? key})
      : super(key: key);

  @override
  State<BgScreenWrapper> createState() => _BgScreenWrapperState();
}

class _BgScreenWrapperState extends State<BgScreenWrapper> {
  Widget get _background => Image.asset(
        widget.background,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [_background, SafeArea(child: widget.child)]));
  }
}
