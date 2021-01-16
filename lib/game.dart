import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game with TapDetector {
  Color clr = Color(0xffffffff);
  bool isLeft = false;
  bool isTouching = false;
  Vector2 pos = Vector2(0, 0);
  Sprite player;
  int ctr = 0;
  List<Sprite> objects = [];
  List<Vector2> positions = [];
  Sprite background;

  Future<void> onLoad() async{
    await images.load('ship_test.png'); 
    await images.load('laserRed01.png'); 
    await images.load('BG.png'); 
    pos = Vector2(size.x/2 - 50, size.y-100);
    player = Sprite(images.fromCache('ship_test.png'));
    background = Sprite(images.fromCache('BG.png'));
  }

  void render(Canvas canvas) {
    Paint opacityPaint = Paint()..color = Colors.white.withOpacity(0.2);
    background.render(canvas, position: Vector2(0, 0), overridePaint: opacityPaint);
    // Ship
    player.render(canvas,
        position: Vector2(pos.x, size.y - 50), size: Vector2(50, 50));
    print(objects.length);
    for (int i = 0; i < objects.length; i++) {
      objects[i].render(canvas, position: positions[i], size: Vector2(9, 54));
    }
  }

  void update(double t) {
    ctr += 1;
    List<int> todel = [];
    for (int i = 0; i < objects.length; i++) {
      positions[i].y -= 10;
      if (positions[i].y <= -54) {
        todel.add(i);
      }
    }
    for (int i = todel.length - 1; i >= 0; i--) {
      positions.removeAt(i);
      objects.removeAt(i);
    }
    if (ctr >= 10) {
      ctr = 0;
      objects.add(new Sprite(images.fromCache('laserRed01.png')));
      positions.add(Vector2(pos.x + 25, pos.y));
    }
    if (isTouching) {
      if (isLeft) {
        pos.x -= 5;
      } else {
        pos.x += 5;
      }
      if (pos.x < 0) {
        pos.x = 0;
      }
      if (pos.x > size.x - 100) {
        pos.x = size.x - 100;
      }
    }
  }

  void onTapDown(TapDownDetails d) {
    isTouching = true;
    double screenCenterX = size.x / 2;
    if (d.globalPosition.dx < screenCenterX) {
      isLeft = true;
    } else {
      isLeft = false;
    }
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    isTouching = false;
  }
}
