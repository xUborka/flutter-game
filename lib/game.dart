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
    List<int> todel_proj = [];
    List<int> todel_enemy = [];
    for (int i = 0; i < projectiles.length; i++) {
      projectiles[i].move();
      if (projectiles[i].position.y <= -54) {
        todel_proj.add(i);
      }
    }

    for (int i = todel_proj.length - 1; i >= 0; i--) {
      projectiles.removeAt(todel_proj[i]);
    }
    enemies.forEach((enemy) => enemy.move());
    for (int i = 0; i < enemies.length; i++) {
      if (enemies[i].position.y > size.y) {
        todel_enemy.add(i);
      }
    }
    // print(enemies.length);
    // print(projectiles.length);
    for (int i = todel_enemy.length - 1; i >= 0; i--) {
      enemies.removeAt(todel_enemy[i]);
    }
    if (ctr >= 10) {
      // HACKS
      List<String> colors = ["pink", "orange", "yellow", "blue", "black"];
      enemies.add(Enemy(
          enemyImage: images
              .fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),
          screenSize: this.size,
          startPos: Vector2(
              min(Random().nextDouble() * this.size.x, this.size.x - 50),
              -50.0)));
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
    // Test projectile impact
    bamm();
    if (isTouching) {
      ship.move(isLeft);
    }
  }

  void bamm() {
    List<int> todel_proj = [];
    for (int i = 0; i < projectiles.length; i++) {
      List<int> todel_enemy = [];
      for (int j = 0; j < enemies.length; j++) {
        Projectile crntProjectile = projectiles[i];
        Enemy crntEnemy = enemies[j];
        Offset peakPoint = Offset(
            crntProjectile.position.x + crntProjectile.size.x / 2.0,
            crntProjectile.position.y);
        // print(peakPoint);
        // print(peakPoint);
        if (crntEnemy.toRect().contains(peakPoint)) {
          // print('true');
          todel_enemy.add(j);
          todel_proj.add(i);
        }
      }
      print('enemy : ${todel_enemy.length}');
      for (int k = todel_enemy.length - 1; k >= 0; k--) {
        if (enemies.length > todel_enemy[k]) {
          enemies.removeAt(todel_enemy[k]);
          score += 10;
        }
      }
    }
    print('proj : ${todel_proj.length}');
    for (int i = todel_proj.length - 1; i >= 0; i--) {
      if (projectiles.length > todel_proj[i]) {
        projectiles.removeAt(todel_proj[i]);
      }
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
