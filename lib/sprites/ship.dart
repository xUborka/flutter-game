import 'dart:ui';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';
import 'package:flutter_game/game/game.dart';

enum Direction{
  left,
  right,
  none
}

class Ship extends SpriteComponent with HasGameRef<SpaceGame> {
  double speed;
  Direction dir;
  Ship(Sprite sp) : super.fromSprite(50, 50, sp) {
    speed = 180;
  }

  set movementDirection(Direction direction) => dir = direction;
  Direction get movementDirection => dir;

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

  @override
  void update(double dt){
    switch(dir){
      case Direction.left: 
        x -= speed * dt;
        break;
      case Direction.right:
        x += speed * dt;
        break;
      default:
        break;
    }
    if (x < 0) {
      x = 0;
    }
    final double maxPos = gameRef.size.width - width;

    if (x > maxPos) {
      x = maxPos;
    }
    super.update(dt);
  }
}
