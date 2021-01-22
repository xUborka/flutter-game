import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';

class Projectile extends SpriteComponent {
  Vector2 screenSize;
  Projectile({Image projectileImage, this.screenSize, Vector2 startPos})
      : super.fromSprite(Vector2(9.0, 54.0), new Sprite(projectileImage)) {
    this.position = startPos;
  }

  @override
  void render(Canvas c) {
    c.save();
    sprite.render(c, position: this.position, size: this.size);
    super.render(c);
    c.restore();
  }
}
