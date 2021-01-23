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

/// TODO : Document
class SpaceGame extends Game with TapDetector {
  /// TODO : Document
  Ship ship;

  /// TODO : Document
  int ctr = 0;

  /// TODO : Document
  List<Projectile> projectiles = [];

  /// TODO : Document
  List<Enemy> enemies = [];

  /// TODO : Document
  bool isLeft = false;

  /// TODO : Document
  bool isTouching = false;

  /// TODO : Document
  Sprite background;

  /// TODO : Document
  HomeView homeView;

  /// TODO : Document
  View activeView = View.home;

  /// TODO : Document
  SpaceGame();

  /// TODO : Document
  TextConfig ingameTextConfig = TextConfig(color: Colors.white);

  /// TODO : Document
  int score = 0;

  /// TODO : Global valamibe és úgy hivatkozni rá, nem stringként lejjebb
  @override
  Future<void> onLoad() async {
    await Future.forEach(
      <String>[
        'ship_test.png',
        'laserRed01.png',
        'Enemies/black_enemy.png',
        'Enemies/blue_enemy.png',
        'Enemies/orange_enemy.png',
        'Enemies/pink_enemy.png',
        'Enemies/yellow_enemy.png',
        'Menu/BG.png',
        'Menu/Start_BTN.png',
        'Menu/Exit_BTN.png'
      ],
      (String image) async {
        await images.load(image);
      },
    );

    ship = Ship(
      game: this,
      shipImage: images.fromCache('ship_test.png'),
      screenSize: size,
      speed: 5,
    );
    background = Sprite(images.fromCache('Menu/BG.png'));
    homeView = HomeView(game: this);
  }

  /// TODO : Document
  @override
  void render(Canvas canvas) {
    if (activeView == View.home) {
      homeView.render(canvas);
    } else if (activeView == View.game) {
      // Dummy Background
      final Paint opacityPaint = Paint()..color = Colors.white.withOpacity(0.2);
      background.render(
        canvas,
        position: Vector2(0, 0),
        overridePaint: opacityPaint,
      );
      // Ship
      ship.render(canvas);
      // Projectiles
      projectiles.forEach((Projectile projectile) => projectile.render(canvas));
      enemies.forEach((Enemy enemy) => enemy.render(canvas));

      ingameTextConfig.render(canvas, 'Score : $score', Vector2(0, 0));
    }
  }

  /// TODO : Document
  @override
  void update(double t) {
    ctr += 1;
    List<int> todelProjectiles = [];
    List<int> todelEnemies = [];
    for (int i = 0; i < projectiles.length; i++) {
      projectiles[i].move();
      if (projectiles[i].position.y <= -54) {
        todelProjectiles.add(i);
      }
    }

    for (int i = todelProjectiles.length - 1; i >= 0; i--) {
      projectiles.removeAt(todelProjectiles[i]);
    }
    enemies.forEach((Enemy enemy) => enemy.move());
    for (int i = 0; i < enemies.length; i++) {
      if (enemies[i].position.y > size.y) {
        todelEnemies.add(i);
      }
    }

    for (int i = todelEnemies.length - 1; i >= 0; i--) {
      enemies.removeAt(todelEnemies[i]);
    }
    if (ctr >= 10) {
      // HACKS
      final List<String> colors = ['pink', 'orange', 'yellow', 'blue', 'black'];
      enemies.add(
        Enemy(
          enemyImage: images
              .fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),
          screenSize: size,
          startPos:
              Vector2(min(Random().nextDouble() * size.x, size.x - 50), -50.0),
        ),
      );
    }
    if (ctr >= 10) {
      //random score incrementation
      score += 1;
      ctr = 0;
      projectiles.add(
        Projectile(
          projectileImage: images.fromCache('laserRed01.png'),
          screenSize: size,
          startPos: Vector2(ship.position.x + 21, ship.position.y - 50),
          speed: 10.0,
        ),
      );
    }
    // Test projectile impact
    bamm();
    if (isTouching) {
      ship.move(toLeft: isLeft);
    }
  }

  /// TODO : Document
  void bamm() {
    List<int> todelProjectile = [];
    for (int i = 0; i < projectiles.length; i++) {
      List<int> todelEnemy = [];
      for (int j = 0; j < enemies.length; j++) {
        final Projectile crntProjectile = projectiles[i];
        final Enemy crntEnemy = enemies[j];
        final Offset peakPoint = Offset(
            crntProjectile.position.x + crntProjectile.size.x / 2.0,
            crntProjectile.position.y);
        if (crntEnemy.toRect().contains(peakPoint)) {
          todelEnemy.add(j);
          todelProjectile.add(i);
        }
      }
      for (int k = todelEnemy.length - 1; k >= 0; k--) {
        if (enemies.length > todelEnemy[k]) {
          enemies.removeAt(todelEnemy[k]);
          score += 10;
        }
      }
    }
    for (int i = todelProjectile.length - 1; i >= 0; i--) {
      if (projectiles.length > todelProjectile[i]) {
        projectiles.removeAt(todelProjectile[i]);
      }
    }
  }

  /// TODO : Document
  @override
  void onTapDown(TapDownDetails d) {
    if (activeView == View.home) {
      homeView.handleTapDown(d);
    }
    isTouching = true;
    final double screenCenterX = size.x / 2;
    isLeft = d.globalPosition.dx < screenCenterX;
  }

  /// TODO : Document
  @override
  void onTapUp(TapUpDetails tapUpDetails) {
    if (activeView == View.home) {
      homeView.handleTapUp(tapUpDetails);
    }
    isTouching = false;
  }
}
