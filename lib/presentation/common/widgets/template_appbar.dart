import 'package:flutter/material.dart';

class TemplateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;

  const TemplateAppBar({this.color, this.title, this.leading, this.actions, this.elevation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: leading,
      centerTitle: true,
      title: title,
      actions: actions,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size(AppBar().preferredSize.width, AppBar().preferredSize.height);
}
