import 'dart:ui';

import 'localization_manager.dart';

extension NumberParsing on Locale {
  bool isCurrentLocaleEng() {
    return this == LocalizationManager.getDefaultLocale();
  }
}
