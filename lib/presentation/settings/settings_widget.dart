import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router.gr.dart';
import 'package:flutter_template_project/presentation/common/widgets/icon_row.dart';
import 'package:flutter_template_project/presentation/common/widgets/template_appbar.dart';
import 'package:flutter_template_project/presentation/settings/bloc/settings_cubit.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';

class SettingsWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsWidget({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (_, state) {
        if (state is SettingsLogoutState) context.router.replaceAll([const LoginScreen()]);
      },
      child: Scaffold(
        appBar: TemplateAppBar(
          title: Text(AppStrings.settings.tr()),
          color: AppColors.deepBlue,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.popRoute();
                onPressed();
              }),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            IconRow(
              icon: Icons.language,
              text: AppStrings.language.tr(),
              onPressed: () => context.pushRoute(LanguageScreen(locale: context.locale)),
            ),
            IconRow(icon: Icons.notification_add_outlined, text: AppStrings.notifications.tr(), onPressed: () {}),
            const Divider(),
            IconRow(icon: Icons.info_outline, text: AppStrings.aboutUs.tr(), onPressed: () {}),
            IconRow(icon: Icons.contact_support_outlined, text: AppStrings.contactUs.tr(), onPressed: () {}),
            IconRow(icon: Icons.account_balance_outlined, text: AppStrings.terms.tr(), onPressed: () {}),
            const Divider(),
            IconRow(icon: Icons.logout_outlined, text: AppStrings.logout.tr(), onPressed: () => context.read<SettingsCubit>().logout()),
          ],
        ),
      ),
    );
  }
}
