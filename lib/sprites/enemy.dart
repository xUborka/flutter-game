import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteComponent {
  double speed;
  Enemy(Sprite sp) : super.fromSprite(50, 50, sp) {
    speed = 3;
  }

  @override
  void render(Canvas c) {
    c.save();
    super.render(c);
    c.restore();
  }

  @override
  void update(double dt) {
    // Unnecessary override!
    super.update(dt);
  }

  void move() {
    y += speed;
  }
}
