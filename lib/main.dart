import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_game/audio_manager.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/settings_manager.dart';
import 'package:flutter_game/main_widget.dart';
import 'package:flutter_game/widgets/assets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setPortraitUpOnly();

  final futures = Future.wait([
    GameAssets.load(),
    WidgetsAssets.load(),
    AudioManager.load(),
    SettingsManager.load(),
  ]);

  if (!kReleaseMode) {
    await futures;
  }
  runApp(EasyLocalization(
    supportedLocales: getSupportedLocales(),
    path: 'assets/translations',
    fallbackLocale: getDefaultLocale(),
    child: MainWidget(),
  ));
}

// TODO Move to a global config file
List<Locale> getSupportedLocales() => [const Locale('en'), const Locale('hu')];
Locale getDefaultLocale() => const Locale('en', 'US');
