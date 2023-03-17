import 'package:flutter_template_project/data/db/persistence_helper.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ClickLocalRepo {
  final _clicksKey = 'clicks';

  Future<void> saveClicks({required int clicks}) async {
    await Hive.box(HiveBoxes.userBox).delete(_clicksKey);
    await Hive.box(HiveBoxes.userBox).put(_clicksKey, clicks);
  }
}
