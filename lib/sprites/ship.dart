import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document
class Ship extends SpriteComponent {
  /// TODO : Document
  SpaceGame game;

  /// TODO : Document
  Vector2 screenSize;

  /// TODO : Document
  double speed;

  /// TODO : Document
  Ship({this.game, Image shipImage, this.screenSize, this.speed})
      : super.fromSprite(Vector2.all(50.0), Sprite(shipImage)) {
    position = Vector2(
      screenSize.x / 2 - size.x / 2,
      screenSize.y - size.y,
    );
  }

  @override
  void render(Canvas c) {
    c.save();
    sprite.render(c, position: position, size: size);
    super.render(c);
    c.restore();
  }

  /// TODO : Document
  /// TODO : Refactor bool param to 2 functions
  void move({bool toLeft}) {
    position.x += (toLeft ? -1 : 1) * speed;

    if (position.x < 0) {
      position.x = 0;
    }

    final double maxPos = game.size.x - 50;

    if (position.x > maxPos) {
      position.x = maxPos;
    }
  }
}
