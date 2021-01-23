import 'dart:math';
import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/sprites/enemy.dart';
import 'package:flutter_game/sprites/projectile.dart';
import 'package:flutter_game/sprites/ship.dart';
import 'package:flutter_game/view.dart';
import 'package:flutter_game/views/home.dart';

class SpaceGame extends Game with TapDetector {
  Ship myShip;
  int ctr = 0;
  List<Projectile> projectiles = [];
  List<Enemy> enemies = [];
  bool isLeft = false;
  bool isTouching = false;
  Sprite background;
  HomeView homeView;
  View activeView = View.home;
  SpaceGame();

  Future<void> onLoad() async {
    await images.load('ship_test.png');
    await images.load('laserRed01.png');
    await images.load('Enemies/black_enemy.png');
    await images.load('Enemies/blue_enemy.png');
    await images.load('Enemies/orange_enemy.png');
    await images.load('Enemies/pink_enemy.png');
    await images.load('Enemies/yellow_enemy.png');
    await images.load('Menu/BG.png');
    await images.load('Menu/Start_BTN.png');
    await images.load('Menu/Exit_BTN.png');
    myShip = Ship(
      shipImage: images.fromCache('ship_test.png'),
      screenSize: size,
    );
    background = Sprite(images.fromCache('Menu/BG.png'));
    homeView = HomeView(game: this);
  }

  void render(Canvas canvas) {
    if (activeView == View.home) {
      homeView.render(canvas);
    } else if (activeView == View.game) {
      // Dummy Background
      Paint opacityPaint = Paint()..color = Colors.white.withOpacity(0.2);
      background.render(
        canvas,
        position: Vector2(0, 0),
        overridePaint: opacityPaint,
      );
      // Ship
      myShip.render(canvas);
      // Projectiles
      projectiles.forEach((projectile) => projectile.render(canvas));
      enemies.forEach((enemy) => enemy.render(canvas));
    }
  }

  void update(double t) {
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
    enemies.forEach((enemy) => enemy.position.y += enemy.speed);
    if (ctr >= 10) {
      // HACKS
      List<String> colors = ["pink", "orange", "yellow", "blue", "black"];

      enemies.add(Enemy(enemyImage: images.fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),screenSize: this.size, startPos: Vector2(Random().nextDouble() * this.size.x,-50.0)));
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
    if (activeView == View.home) {
      homeView.handleTapDown(d);
    }
    isTouching = true;
    double screenCenterX = size.x / 2;
    if (d.globalPosition.dx < screenCenterX) {
      isLeft = true;
    } else {
      isLeft = false;
    }
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    if (activeView == View.home) {
      homeView.handleTapUp(tapUpDetails);
    }
    isTouching = false;
  }
}
