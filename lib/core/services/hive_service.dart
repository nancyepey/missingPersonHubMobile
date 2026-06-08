
import 'package:hive/hive.dart';

class HiveService {
  static final box = Hive.box('appBox');

  static void saveLanguage(String lang) {
    box.put('language', lang);
  }

  static String getLanguage() {
    return box.get('language', defaultValue: 'fr');
  }
}
