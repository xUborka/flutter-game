import 'package:shared_preferences/shared_preferences.dart';
import './audio_manager.dart';

class SettingsManager {
  static bool isFirstAccess;
  static bool _isMusicEnabled;
  static bool isSfxEnabled;
  static String currentLocaleCode;

  static set isMusicEnabled(bool value) {
    _isMusicEnabled = value;
    if (_isMusicEnabled) {
      AudioManager.titleMusic();
    } else {
      AudioManager.stopMusic();
    }
  }

  static bool get isMusicEnabled => _isMusicEnabled;

  static void setControlsInFirstAccess({bool useGamepad}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isFirstAccess = false;
    await prefs.setBool('SettingsManager.isFirstAccess', false);
  }

  static void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('SettingsManager.isFirstAccess', isFirstAccess);
    await prefs.setBool('SettingsManager.isMusicEnabled', isMusicEnabled);
    await prefs.setBool('SettingsManager.isSfxEnabled', isSfxEnabled);
    await prefs.setString('SettingsManager.currentLocaleCode', currentLocaleCode);
  }

  static Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isFirstAccess = prefs.getBool('SettingsManager.isFirstAccess') ?? true;
    isMusicEnabled = prefs.getBool('SettingsManager.isMusicEnabled') ?? true;
    isSfxEnabled = prefs.getBool('SettingsManager.isSfxEnabled') ?? true;
    currentLocaleCode = prefs.getString('SettingsManager.currentLocaleCode') ?? 'en';
  }
}
