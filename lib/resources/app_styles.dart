import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppStyles {
  //regular
  static const regularBlack12 = TextStyle(color: AppColors.black, fontSize: 12);
  static const regularBlack14 = TextStyle(color: AppColors.black, fontSize: 14);
  static const regularBlack16 = TextStyle(color: AppColors.black, fontSize: 16);
  static const regularBlack18 = TextStyle(color: AppColors.black, fontSize: 18);
  static const regularWhite18 = TextStyle(color: AppColors.white, fontSize: 18);
  static const regularBlack36 = TextStyle(color: AppColors.black, fontSize: 36);
  static const regularWhite14 = TextStyle(color: AppColors.white, fontSize: 14);
  static const regularHint16 = TextStyle(color: AppColors.lightGrey3, fontSize: 16);

  //medium
  static const mediumWhite12 = TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12);
  static const mediumBlue14 = TextStyle(color: AppColors.blue, fontWeight: FontWeight.w500, fontSize: 14);
  static const alphaHeaders = TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.w500, fontSize: 18);
  static const mediumDeepBlue18 = TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.w500, fontSize: 18);

  //bold
  static const boldWhite18 = TextStyle(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 18);
  static const boldBlue18 = TextStyle(color: AppColors.blue, fontWeight: FontWeight.w700, fontSize: 18);
  static const boldBlack24 = TextStyle(color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 24);
}
