import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteComponent {
  Vector2 screenSize;
  double speed;
  Enemy({Image enemyImage, this.screenSize, Vector2 startPos})
      : super.fromSprite(Vector2(50.0, 50.0), new Sprite(enemyImage)) {
    this.position = startPos;
    this.speed = 3;
  }

  @override
  void render(Canvas c) {
    c.save();
    sprite.render(c, position: this.position, size: this.size);
    super.render(c);
    c.restore();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void move() {
    this.position.y += this.speed;
  }
}
