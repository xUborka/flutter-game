import 'package:flame/components/position_component.dart';
import 'package:flame/extensions/canvas.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/game.dart';

class MenuButton extends PositionComponent {
  BoxGame game;
  Sprite img;
  bool tapped;
  
  MenuButton(_game, image) {
    game = _game;
    img = image;
    tapped = false;
    position = Vector2(0, 0);
    size = Vector2(0, 0);
  }

  @override
  void render(Canvas c) {
    c.save();
    img.render(c, position: this.position, size: this.size);
    super.render(c);
    c.restore();
  }

  bool onTapDown(TapDownDetails d){
    return true;
  }
  bool onTapUp(TapUpDetails d){
    return true;
  }
}
