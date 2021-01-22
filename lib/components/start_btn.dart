import 'package:flutter/gestures.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flutter_game/components/menu_btn.dart';
import 'package:flutter_game/view.dart';

class StartButton extends MenuButton with Tapable {
  StartButton(_game, _img) : super(_game, _img);

  @override
  bool onTapDown(TapDownDetails d) {
    tapped = true;
    return true;
  }

  @override
  bool onTapUp(TapUpDetails d) {
    if (tapped){
      game.activeView = View.game;
    }
    return true;
  }

  // @override
  // bool onTapCancel() {
  //   return true;
  // }
}
