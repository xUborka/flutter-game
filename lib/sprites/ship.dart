import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';

class Ship extends SpriteComponent {
  Vector2 screenSize;
  Ship({Image shipImage, this.screenSize}) : super.fromSprite(Vector2.all(50.0), new Sprite(shipImage)) {
    this.position = Vector2(
      screenSize.x / 2 - this.size.x / 2,
      screenSize.y - this.size.y,
    );
  }
}
