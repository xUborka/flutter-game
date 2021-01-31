import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/main_widget.dart';
import 'package:flutter_game/managers/localization_manager.dart';
import 'package:flutter_game/managers/audio_manager.dart';
import 'package:flutter_game/managers/settings_manager.dart';
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
    supportedLocales: LocalizationManager.getSupportedLocales(),
    path: 'assets/translations',
    fallbackLocale: LocalizationManager.getDefaultLocale(),
    child: MainWidget(),
  ));
}
