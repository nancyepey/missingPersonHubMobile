
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:missingpeoplehub/core/providers/language_provider.dart';
import 'app_strings.dart';

class AppText {
  static dynamic of(WidgetRef ref) {
    final lang = ref.watch(languageProvider);

    return lang == AppLanguage.fr
        ? AppStringsFR()
        : AppStrings();
  }
}
