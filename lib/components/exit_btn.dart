import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter_game/components/menu_btn.dart';

class ExitButton extends MenuButton with Tapable {
  ExitButton(_game, _img) : super(_game, _img);

  @override
  bool onTapDown(TapDownDetails d) {
    tapped = true;
    return true;
  }

  @override
  bool onTapUp(TapUpDetails d) {
    if (tapped) {
      Future.delayed(const Duration(milliseconds: 250), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }
    return true;
  }

  // @override
  // bool onTapCancel() {
  //   return true;
  // }
}
