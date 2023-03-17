import 'package:flutter/material.dart';
import 'package:flutter_template_project/presentation/common/widgets/template_appbar.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_styles.dart';

class ProfileBgScreen extends StatefulWidget {
  final Widget child;
  final String title;
  final Widget? leadingButton;
  final Widget? actionButton;

  const ProfileBgScreen({required this.child, required this.title, required this.leadingButton, required this.actionButton, Key? key})
      : super(key: key);

  @override
  State<ProfileBgScreen> createState() => _ProfileBgScreenState();
}

class _ProfileBgScreenState extends State<ProfileBgScreen> {
  Widget get _background => Container(width: double.infinity, height: double.infinity, color: AppColors.lightBlue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: TemplateAppBar(
          leading: widget.leadingButton,
          color: AppColors.white,
          title: Center(child: Text(widget.title, style: AppStyles.regularBlack18)),
          actions: [widget.actionButton ?? const SizedBox()],
          elevation: 1,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        _background,
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: widget.child)],
          ),
        ),
      ]),
    );
  }
}
