import 'package:flutter/material.dart';
import 'package:flutter_game/views/game_view.dart';
import 'package:flutter_game/views/options_view.dart';
import 'package:flutter_game/views/title_view.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';

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
        '/title': (ctx) => TitleView(),
        '/game': (ctx) => GameView(),
        '/options': (ctx) => OptionsView(),
      },
      initialRoute: '/splash',
    );
  }
}
