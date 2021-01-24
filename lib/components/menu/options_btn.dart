import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter_game/components/menu/menu_btn.dart';
import 'package:flutter_game/game.dart';
import 'package:flutter_game/view.dart';

/// TODO : Document
class OptionsButton extends MenuButton with Tapable {
  /// TODO : Document
  OptionsButton(SpaceGame game, Sprite img) : super(game, img);

  @override
  bool onTapDown(TapDownDetails d) {
    tapped = true;
    return true;
  }

  @override
  bool onTapUp(TapUpDetails d) {
    if (tapped) {
      game.activeView = View.options;
    }
    return true;
  }
}
