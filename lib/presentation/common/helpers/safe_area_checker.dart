import 'package:flutter/cupertino.dart';

mixin SafeAreaChecker {
  bool isNeedSafeArea(BuildContext context) => MediaQuery.of(context).viewPadding.bottom > 0;
}
