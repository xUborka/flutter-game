import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/sprites/projectile.dart';
import 'package:flutter_game/sprites/ship.dart';

class BoxGame extends BaseGame with TapDetector {
  Ship myShip;
  int ctr = 0;
  List<Projectile> projectiles = [];
  bool isLeft = false;
  bool isTouching = false;
  Sprite background;

  Future<void> onLoad() async {
    await images.load('ship_test.png');
    await images.load('laserRed01.png');
    await images.load('BG.png');
    myShip = Ship(
      shipImage: images.fromCache('ship_test.png'),
      screenSize: size,
    );
    background = Sprite(images.fromCache('BG.png'));
  }

  void render(Canvas canvas) {
    super.render(canvas);
    // Dummy Background
    Paint opacityPaint = Paint()..color = Colors.white.withOpacity(0.2);
    background.render(
      canvas,
      position: Vector2(0, 0),
      overridePaint: opacityPaint,
    );
    // Ship
    // Save and restore required when rendering SpriteComponents
    // for some reason ?!
    canvas.save(); 
    myShip.render(canvas);
    canvas.restore();
    // Projectiles
    for (int i = 0; i < projectiles.length; i++) {
      canvas.save();
      projectiles[i].render(canvas);
      canvas.restore();
    }
  }

  void update(double t) {
    super.update(t);
    ctr += 1;
    List<int> todel = [];
    for (int i = 0; i < projectiles.length; i++) {
      projectiles[i].position.y -= 10;
      if (projectiles[i].position.y <= -54) {
        todel.add(i);
      }
    }
    for (int i = todel.length - 1; i >= 0; i--) {
      projectiles.removeAt(i);
    }
    if (ctr >= 10) {
      ctr = 0;
      projectiles.add(new Projectile(
          screenSize: size,
          projectileImage: images.fromCache('laserRed01.png'),
          startPos: Vector2(myShip.position.x + 21, myShip.position.y - 50)));
    }
    if (isTouching) {
      if (isLeft) {
        myShip.position.x -= 5;
      } else {
        myShip.position.x += 5;
      }
      if (myShip.position.x < 0) {
        myShip.position.x = 0;
      }
      if (myShip.position.x > size.x - 50) {
        myShip.position.x = size.x - 50;
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
