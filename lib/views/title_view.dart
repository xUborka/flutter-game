import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/components/menu/button.dart';
import 'package:flutter_game/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Menu/BG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                label: LocaleKeys.start.tr(),
                onPressed: () => Navigator.of(context).pushNamed('/game'),
              ),
              SizedBox(height: 20),
              Button(
                label: LocaleKeys.options.tr(),
                onPressed: () => Navigator.of(context).pushNamed('/options'),
              ),
              SizedBox(height: 20),
              Button(
                label: LocaleKeys.exit.tr(),
                onPressed: () => Future.delayed(const Duration(milliseconds: 50), () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
