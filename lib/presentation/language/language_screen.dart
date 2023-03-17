import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/presentation/common/widgets/template_appbar.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_constants.dart';
import 'package:flutter_template_project/resources/app_strings.dart';

class LanguageScreen extends StatefulWidget {
  final Locale locale;

  const LanguageScreen({required this.locale, Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Language? language;

  @override
  void initState() {
    if (widget.locale == AppConstants.english) {
      language = Language.english;
    } else {
      language = Language.russian;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TemplateAppBar(title: Text(AppStrings.language.tr()), color: AppColors.deepBlue),
      body: ListView(
        children: [
          RadioListTile<Language>(
            value: Language.english,
            title: Text(AppStrings.english.tr(), style: const TextStyle(color: AppColors.deepBlue)),
            activeColor: AppColors.deepBlue,
            groupValue: language,
            onChanged: (value) => setState(() {
              language = value;
              _setEn();
              // Navigator.pop(context);
            }),
          ),
          RadioListTile<Language>(
            value: Language.russian,
            title: Text(AppStrings.russian.tr(), style: const TextStyle(color: AppColors.deepBlue)),
            activeColor: AppColors.deepBlue,
            groupValue: language,
            onChanged: (value) => setState(() {
              language = value;
              _setRu();
              // Navigator.pop(context);
            }),
          ),
        ],
      ),
    );
  }

  void _setEn() async => await context.setLocale(AppConstants.english);

  void _setRu() async => await context.setLocale(AppConstants.russian);
}

enum Language { english, russian }
