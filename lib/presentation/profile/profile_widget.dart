import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/presentation/common/helpers/toast_mixin.dart';
import 'package:flutter_template_project/presentation/common/widgets/app_loading_overlay.dart';
import 'package:flutter_template_project/presentation/common/widgets/avatar.dart';
import 'package:flutter_template_project/presentation/common/widgets/profile_bg_screen.dart';
import 'package:flutter_template_project/presentation/profile/bloc/profile_cubit.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/app_strings.dart';
import 'package:flutter_template_project/resources/app_styles.dart';
import 'package:flutter_template_project/resources/images_paths.dart';

class ProfileWidget extends StatelessWidget with ToastMixin {
  ProfileWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailed) showToast(state.error);
      },
      builder: (context, state) => ProfileBgScreen(
        title: AppStrings.account.tr(),
        leadingButton: _backButton(context),
        actionButton: _actionButton,
        child: AppLoadingOverlay(
          isLoading: state is ProfileProcessing,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSucceed) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(flex: 40),
                        const Avatar(),
                        const SizedBox(height: 20),
                        Text(AppStrings.johnDow.tr(), style: AppStyles.regularBlack18, textAlign: TextAlign.center),
                        const Spacer(flex: 30),
                        _iconWithTitle,
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget get _iconWithTitle => SizedBox(
        width: 150,
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(color: AppColors.deepBlue, image: AssetImage(ImagesPaths.mode)),
              const SizedBox(width: 12),
              Text(AppStrings.editProfile.tr(), style: AppStyles.regularBlack16, textAlign: TextAlign.center),
            ],
          ),
        ),
      );

  Widget _backButton(BuildContext context) {
    return IconButton(onPressed: () => context.popRoute(), icon: const Icon(Icons.arrow_back), color: AppColors.black);
  }

  Widget get _actionButton => IconButton(onPressed: () {}, icon: const Icon(Icons.settings), color: AppColors.black);
}
