import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_game/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_game/widgets/button.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/test_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 200,
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/test_banner.png'),
                    fit: BoxFit.fill,
                  ),
                )),
              ),
              SizedBox(height: 20),
              Button(
                buttonType: ButtonType.SPECIAL,
                label: LocaleKeys.start.tr(),
                onPressed: () => Navigator.of(context).pushNamed('/game'),
              ),
              // SizedBox(height: 20),
              // Button(
              //   buttonType: ButtonType.SECONDARY,
              //   label: LocaleKeys.options.tr(),
              //   onPressed: () => Navigator.of(context).pushNamed('/options'),
              // ),
              // SizedBox(height: 20),
              // Button(
              //   buttonType: ButtonType.SECONDARY,
              //   label: LocaleKeys.credits.tr(),
              //   onPressed: () => Navigator.of(context).pushNamed('/credits'),
              // ),
              // SizedBox(height: 20),
              // Button(
              //   buttonType: ButtonType.SECONDARY,
              //   label: LocaleKeys.exit.tr(),
              //   onPressed: () => Future.delayed(
              //     const Duration(milliseconds: 50),
              //     () => SystemChannels.platform
              //         .invokeMethod('SystemNavigator.pop'),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
