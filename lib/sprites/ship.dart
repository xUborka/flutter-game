import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game/game.dart';
import 'package:flame/sprite.dart';

class Ship extends SpriteComponent {
  Game game;
  Vector2 screenSize;
  double speed;
  Ship({Game game, Image shipImage, this.screenSize, double speed})
      : super.fromSprite(Vector2.all(50.0), new Sprite(shipImage)) {
    this.position = Vector2(
      screenSize.x / 2 - this.size.x / 2,
      screenSize.y - this.size.y,
    );
    this.speed = speed;
    this.game = game;
  }

  @override
  void render(Canvas c) {
    c.save();
    sprite.render(c, position: this.position, size: this.size);
    super.render(c);
    c.restore();
  }

  void move(bool toLeft) {
    if (toLeft) {
      this.position.x -= 5;
    } else {
      this.position.x += 5;
    }
    if (this.position.x < 0) {
      this.position.x = 0;
    }
    if (this.position.x > game.size.x - 50) {
      this.position.x = game.size.x - 50;
    }
  }
}
