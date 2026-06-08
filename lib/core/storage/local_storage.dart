import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static Future init() async {
    await Hive.initFlutter();
    await Hive.openBox("app");
  }

  static save(String key, dynamic value) {
    Hive.box("app").put(key, value);
  }

  static get(String key) {
    return Hive.box("app").get(key);
  }
}