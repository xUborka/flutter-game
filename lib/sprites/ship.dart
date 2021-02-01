import 'dart:ui';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';
import 'package:flutter_game/game/game.dart';

class Ship extends SpriteComponent with HasGameRef<SpaceGame> {
  double speed;

  Ship(Sprite sp) : super.fromSprite(50, 50, sp) {
    speed = 3;
  }

  @override
  void render(Canvas c) {
    c.save();
    // HACK Because size is not available in constructor
    if (x == 0 && y == 0){
      x = gameRef.size.width/2.0-25;
      y = gameRef.size.height-50;
    }
    super.render(c);
    c.restore();
  }

  /// TODO : Refactor bool param to 2 functions
  void move({bool toLeft}) {
    x += (toLeft ? -1 : 1) * speed;
    if (x < 0) {
      x = 0;
    }
    final double maxPos = gameRef.size.width - 50;

    if (x > maxPos) {
      x = maxPos;
    }
  }
}
