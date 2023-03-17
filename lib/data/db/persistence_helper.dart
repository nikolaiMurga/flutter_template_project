import 'package:flutter_template_project/data/entities/user_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxes {
  static const userBox = 'user_box';
}

class HiveTypeIds {
  static const user = 0;
}

class PersistenceHelper {
  static Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    //register adapters
    Hive.registerAdapter(UserEntityAdapter());

    //open boxes
    await Future.wait([
      Hive.openBox(HiveBoxes.userBox),
    ]);

    //clear boxes per app launch
    await Future.wait([
      Hive.box(HiveBoxes.userBox).clear(),
    ]);
  }
}
