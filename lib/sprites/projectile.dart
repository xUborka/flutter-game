import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';

/// TODO : Document
class Projectile extends SpriteComponent {
  /// TODO : Document
  Vector2 screenSize;

  /// TODO : Document
  double speed;

  /// TODO : Document
  Projectile(
      {Image projectileImage, this.screenSize, Vector2 startPos, this.speed})
      : super.fromSprite(Vector2(9.0, 54.0), Sprite(projectileImage)) {
    position = startPos;
  }

  @override
  void render(Canvas c) {
    c.save();
    sprite.render(c, position: position, size: size);
    super.render(c);
    c.restore();
  }

  /// TODO : Document
  void move() {
    position.y -= speed;
  }
}
