import 'package:flutter/material.dart';
import 'package:flutter_template_project/resources/app_colors.dart';
import 'package:flutter_template_project/resources/images_paths.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  // TODO CircleAvatar
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: AssetImage(ImagesPaths.avatarImage)),
        Positioned(
          bottom: 0,
          right: 0,
          child: FloatingActionButton(
              foregroundColor: AppColors.lightGray1,
              backgroundColor: AppColors.white,
              child: const ImageIcon(AssetImage(ImagesPaths.localSee)),
              onPressed: () {}),
        ),
      ],
    );
  }
}


