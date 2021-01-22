import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/components/position_component.dart';
import 'package:flame/extensions/canvas.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class MenuButton extends PositionComponent with Tapable {
  Sprite img;
  int test = 0;
  MenuButton({img, position, size}) {
    this.img = img;
    this.position = position;
    this.size = size;
  }

  @override
  void render(Canvas c) {
    c.save();
    img.render(c, position: this.position, size: this.size);
    super.render(c);
    c.restore();
  }

  @override
  bool onTapUp(TapUpDetails details) {
    test -= 1;
    print("tap up - $test");
    return true;
  }

  @override
  bool onTapDown(TapDownDetails details) {
    test += 1;
    print("tap down - $test");
    return true;
  }

  @override
  bool onTapCancel() {
    print("tap cancel");
    return true;
  }
}
