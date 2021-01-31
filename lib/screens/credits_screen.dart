import 'package:flutter/material.dart';
import 'package:flutter_game/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/button.dart';
import '../widgets/label.dart';
import '../widgets/pattern_container.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return PatternContainer(
        child: Center(
      child: Column(children: [
        SizedBox(height: 40),
        Label(label: LocaleKeys.credits.tr(), fontSize: 60, fontColor: Color(0xFFe3e3e3)),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: Color(0xFFe3e3e3),
              ),
              color: Color(0xFF333c57),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  label: 'Game made by xGurke & Geryllaz',
                  fontSize: 18,
                  fontColor: Color(0xFF94b0c2),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Button(
          buttonType: ButtonType.PRIMARY,
          label: LocaleKeys.ok.tr(),
          onPressed: () => Navigator.of(ctx).pop(),
        ),
        SizedBox(height: 20),
      ]),
    ));
  }
}
