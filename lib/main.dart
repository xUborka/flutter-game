import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_game/assets.dart';
import 'package:flutter_game/main_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setPortraitUpOnly();
  final futures = Future.wait([
    Assets.load()
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
