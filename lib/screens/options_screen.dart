import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/generated/locale_keys.g.dart';

import '../extensions.dart';
import '../managers/settings_manager.dart';
import '../widgets/button.dart';
import '../widgets/label.dart';
import '../widgets/pattern_container.dart';

class OptionsScreen extends StatefulWidget {
  @override
  State createState() {
    return _OptionsScreenState();
  }
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool _isMusicEnabled;
  bool _isSfxEnabled;

  @override
  void initState() {
    super.initState();
    _isMusicEnabled = SettingsManager.isMusicEnabled;
    _isSfxEnabled = SettingsManager.isSfxEnabled;
  }

  @override
  Widget build(BuildContext ctx) {
    return PatternContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Label(
              label: LocaleKeys.settings.tr(),
              fontColor: Color(0xFFFAFAFA),
              fontSize: 60,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Label(
                              label: LocaleKeys.music.tr(),
                              fontSize: 42,
                              fontColor: Color(0xFFFAFAFA),
                            ),
                            SizedBox(height: 5),
                            Label(
                              label: LocaleKeys.sound.tr(),
                              fontSize: 42,
                              fontColor: Color(0xFFFAFAFA),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Button(
                                buttonType: _isMusicEnabled ? ButtonType.PRIMARY : ButtonType.SECONDARY,
                                label: _isMusicEnabled ? LocaleKeys.on.tr() : LocaleKeys.off.tr(),
                                width: 70,
                                onPressed: () {
                                  setState(() {
                                    _isMusicEnabled = !_isMusicEnabled;
                                    SettingsManager.isMusicEnabled = _isMusicEnabled;
                                    SettingsManager.save();
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              Button(
                                buttonType: _isSfxEnabled ? ButtonType.PRIMARY : ButtonType.SECONDARY,
                                label: _isSfxEnabled ? LocaleKeys.on.tr() : LocaleKeys.off.tr(),
                                width: 70,
                                onPressed: () {
                                  setState(() {
                                    _isSfxEnabled = !_isSfxEnabled;
                                    SettingsManager.isSfxEnabled = _isSfxEnabled;
                                    SettingsManager.save();
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 20),
                            Button(
                              buttonType: context.locale.isCurrentLocaleEng() ? ButtonType.SECONDARY : ButtonType.PRIMARY,
                              label: 'ENG',
                              width: 70,
                              onPressed: () {
                                setState(() {
                                  context.locale = Locale('en');
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Button(
                                buttonType: !context.locale.isCurrentLocaleEng() ? ButtonType.SECONDARY : ButtonType.PRIMARY,
                                label: 'HUN',
                                width: 70,
                                onPressed: () {
                                  setState(() {
                                    context.locale = Locale('hu');
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Button(
              buttonType: ButtonType.PRIMARY,
              label: LocaleKeys.back.tr(),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
