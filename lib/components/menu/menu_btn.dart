import 'package:flame/components/position_component.dart';
import 'package:flame/extensions/canvas.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document What happens here
class MenuButton extends PositionComponent {
  /// TODO : Document
  SpaceGame game;

  /// TODO : Document
  Sprite img;

  /// TODO : Document
  bool tapped;

  String text;

  /// TODO : Document
  TextConfig ingameTextConfig = TextConfig(color: Colors.white, fontSize: 64.0);

  /// TODO : Document
  MenuButton(this.game, this.img, this.text) {
    tapped = false;
    position = Vector2(0, 0);
    size = Vector2(0, 0);
  }

  @override
  void render(Canvas c) {
    c.save();
    // HACK : Look into why this is needed
    img.render(c, position: position, size: size);

    // TODO : align center
    position.x += 20;
    position.y += 10;
    ingameTextConfig.render(c, text, position);
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
