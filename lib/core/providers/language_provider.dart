
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/services/hive_service.dart';



enum AppLanguage { fr, en }

final languageProvider =
StateNotifierProvider<LanguageNotifier, AppLanguage>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<AppLanguage> {
  LanguageNotifier() : super(_loadLanguage());

  static AppLanguage _loadLanguage() {
    final saved = HiveService.getLanguage();
    return saved == 'en' ? AppLanguage.en : AppLanguage.fr;
  }

  void switchLanguage(AppLanguage lang) {
    state = lang;

    /// 🔥 SAVE TO HIVE
    HiveService.saveLanguage(lang == AppLanguage.en ? 'en' : 'fr');
  }
}


/*
enum AppLanguage { fr, en }

final languageProvider = StateProvider<AppLanguage>((ref) {
  return AppLanguage.fr; // default = French
});
*/
