import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter_game/components/menu/menu_btn.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document
class ExitButton extends MenuButton with Tapable {
  /// TODO : Document
  ExitButton(SpaceGame game, Sprite img) : super(game, img);

  @override
  bool onTapDown(TapDownDetails d) {
    tapped = true;
    return true;
  }

  @override
  bool onTapUp(TapUpDetails d) {
    if (tapped) {
      Future.delayed(const Duration(milliseconds: 100), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }
    return true;
  }
}
