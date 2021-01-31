import 'dart:ui';

class LocalizationManager {
  static List<Locale> getSupportedLocales() => const [Locale('en'), Locale('hu')];
  static Locale getDefaultLocale() => const Locale('en', 'US');
}
