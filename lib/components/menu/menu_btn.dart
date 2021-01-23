import 'package:flame/components/position_component.dart';
import 'package:flame/extensions/canvas.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document What happens here
class MenuButton extends PositionComponent {
  /// TODO : Document
  SpaceGame game;

  /// TODO : Document
  Sprite img;

  /// TODO : Document
  bool tapped;

  /// TODO : Document
  MenuButton(this.game, this.img) {
    tapped = false;
    position = Vector2(0, 0);
    size = Vector2(0, 0);
  }

  @override
  void render(Canvas c) {
    c.save();
    img.render(c, position: position, size: size);
    super.render(c);
    c.restore();
  }

  /// TODO : Document
  bool onTapDown(TapDownDetails d) {
    return true;
  }

  /// TODO : Document
  bool onTapUp(TapUpDetails d) {
    return true;
  }
}
