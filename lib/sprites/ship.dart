import 'dart:math';
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
        x = max(x - speed * dt, 0);
        break;
      case Direction.right:
        x = min(x + speed * dt, gameRef.size.width - width);
        break;
      default:
        break;
    }
    super.update(dt);
  }
}
