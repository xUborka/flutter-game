import 'dart:math';
import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/sprites/enemy.dart';
import 'package:flutter_game/sprites/projectile.dart';
import 'package:flutter_game/sprites/ship.dart';
import 'package:flutter_game/view.dart';
import 'package:flutter_game/views/home.dart';

class SpaceGame extends Game with TapDetector {
  Ship ship;
  int ctr = 0;
  List<Projectile> projectiles = [];
  List<Enemy> enemies = [];
  bool isLeft = false;
  bool isTouching = false;
  Sprite background;
  HomeView homeView;
  View activeView = View.home;
  SpaceGame();
  TextConfig ingameTextConfig = TextConfig(color: Colors.white);
  int score = 0;

//todo Global valamibe és úgy hivatkozni rá, nem stringként lejjebb
  Future<void> onLoad() async {
    await Future.forEach([
      "ship_test.png",
      "laserRed01.png",
      "Enemies/black_enemy.png",
      "Enemies/blue_enemy.png",
      "Enemies/orange_enemy.png",
      "Enemies/pink_enemy.png",
      "Enemies/yellow_enemy.png",
      "Menu/BG.png",
      "Menu/Start_BTN.png",
      "Menu/Exit_BTN.png"
    ], (image) async {
      await images.load(image);
    });

    ship = Ship(
        game: this,
        shipImage: images.fromCache('ship_test.png'),
        screenSize: size,
        speed: 5);
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
      ship.render(canvas);
      // Projectiles
      projectiles.forEach((projectile) => projectile.render(canvas));
      enemies.forEach((enemy) => enemy.render(canvas));

      ingameTextConfig.render(canvas, "Score : $score", Vector2(0, 0));
    }
  }

  void update(double t) {
    ctr += 1;
    List<int> todel = [];
    for (int i = 0; i < projectiles.length; i++) {
      projectiles[i].move();
      if (projectiles[i].position.y <= -54) {
        todel.add(i);
      }
    }

    for (int i = todel.length - 1; i >= 0; i--) {
      projectiles.removeAt(i);
    }
    enemies.forEach((enemy) => enemy.move());
    if (ctr >= 10) {
      // HACKS
      var colors = ["pink", "orange", "yellow", "blue", "black"];

      enemies.add(Enemy(
          enemyImage: images
              .fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),
          screenSize: this.size,
          startPos: Vector2(Random().nextDouble() * this.size.x, -50.0)));
    }
    if (ctr >= 10) {
      //random score incrementation
      score += 1;
      ctr = 0;
      projectiles.add(new Projectile(
          screenSize: size,
          projectileImage: images.fromCache('laserRed01.png'),
          startPos: Vector2(ship.position.x + 21, ship.position.y - 50),
          speed: 10));
    }
    if (isTouching) {
      ship.move(isLeft);
    }
  }

  void onTapDown(TapDownDetails d) {
    if (activeView == View.home) {
      homeView.handleTapDown(d);
    }
    isTouching = true;
    double screenCenterX = size.x / 2;
    isLeft = d.globalPosition.dx < screenCenterX;
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    if (activeView == View.home) {
      homeView.handleTapUp(tapUpDetails);
    }
    isTouching = false;
  }
}
