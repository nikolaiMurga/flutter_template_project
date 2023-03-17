import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/flavour_config.dart';
import 'package:flutter_template_project/presentation/common/widgets/icon_row.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/resources/images_paths.dart';

class MenuDrawer extends StatelessWidget {
  final VoidCallback onPressed;
  final flavour = Constants.getFlavour;

  MenuDrawer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: flavour.getFlavourColor(),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 60, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => context.pushRoute(const ProfileScreen()),
                      child: const SizedBox(height: 75, width: 75, child: Image(image: AssetImage(ImagesPaths.avatarImage))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(AppStrings.johnDow.tr(), style: AppStyles.regularWhite18, textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              width: double.maxFinite,
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              child: Column(
                children: [
                  IconRow(
                    icon: Icons.settings,
                    text: AppStrings.settings.tr(),
                    onPressed: () => context.pushRoute(SettingsScreen(onPressed: onPressed)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
