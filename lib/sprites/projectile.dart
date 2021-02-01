import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';

/// TODO : Document
class Projectile extends SpriteComponent {
  /// TODO : Document
  double speed;

  /// TODO : Document
  Projectile(Sprite sp, Position pos) : super.fromSprite(8, 48, sp) {
    speed = 8;
    x = pos.x;
    y = pos.y;
  }

  @override
  void render(Canvas c) {
    c.save();
    super.render(c);
    c.restore();
  }

  /// TODO : Document
  void move() {
    y -= speed;
  }
}
