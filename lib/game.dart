import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game with TapDetector{
  Color clr = Color(0xffffffff);
  bool left = false;
  Vector2 pos = Vector2(0, 0);
  Sprite player;

  Future<void> onLoad() async{
    await images.load('ship_test.png'); 
    pos = Vector2(size.x/2 - 50, size.y-100);
    player = Sprite(images.fromCache('ship_test.png'));

  }

  void render(Canvas canvas) {
    // Background
    Rect bgRect = Rect.fromLTWH(0, 0, size.x, size.y);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);
    // Ship
    player.render(canvas, position: Vector2(pos.x, size.y-100), size: Vector2(100, 100));
  }

  void update(double t) {
    if (left){
      pos.x -= 5;
    } else {
      pos.x += 5;
    }
    if (pos.x < 0){
      pos.x = 0;
    }
    if (pos.x > size.x-100){
      pos.x = size.x-100;
    }
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = size.x / 2;
    if (d.globalPosition.dx < screenCenterX) {
      left = true;
    } else {
      left = false;
    }
}

}