import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/managers/settings_manager.dart';
import 'package:flutter_game/screens/credits_screen.dart';
import 'package:flutter_game/screens/game_screen.dart';
import 'package:flutter_game/screens/options_screen.dart';
import 'package:flutter_game/screens/title_screen.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';

import 'package:easy_localization/easy_localization.dart';

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (ctx) => FlameSplashScreen(
              theme: FlameSplashTheme.dark,
              showBefore: (BuildContext context) {
                return Image.asset('assets/images/flame_splash.gif');
              },
              onFinish: (BuildContext context) {
                Navigator.pushNamed(context, '/title');
              },
            ),
        '/title': (ctx) => TitleScreen(),
        '/game': (ctx) => GameScreen(),
        '/options': (ctx) => OptionsScreen(),
        '/credits': (ctx) => CreditsScreen(),
      },
      initialRoute: kReleaseMode ? '/splash' : '/title',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(SettingsManager.currentLocaleCode),
    );
  }
}
