import 'dart:ui';

import 'package:flutter_game/managers/localization_manager.dart';

extension NumberParsing on Locale {
  bool isCurrentLocaleEng() {
    return this == LocalizationManager.getDefaultLocale();
  }
}
