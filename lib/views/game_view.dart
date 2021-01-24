import 'dart:math';

import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/hud.dart';
import 'package:flutter_game/game.dart';
import 'package:flutter_game/sprites/enemy.dart';
import 'package:flutter_game/sprites/projectile.dart';
import 'package:flutter_game/sprites/ship.dart';

/// TODO : Document
class GameView {
  /// TODO : Document
  final SpaceGame game;

  /// TODO : Document
  Hud hud;

  /// TODO : Document
  Ship ship;

  /// TODO : Document
  Sprite background;

  /// TODO : Document
  int score = 0;

  /// TODO : Document
  int ctr = 0;

  /// TODO : Document
  List<Projectile> projectiles = <Projectile>[];

  /// TODO : Document
  List<Enemy> enemies = <Enemy>[];

  /// TODO : Document
  bool isLeft = false;

  /// TODO : Document
  bool isTouching = false;

  /// TODO : Document
  GameView(this.game) {
    background = Sprite(game.images.fromCache('Menu/BG.png'));

    ship = Ship(
      game: game,
      shipImage: game.images.fromCache('ship_test.png'),
      speed: 5,
    );

    hud = Hud(game);
  }

  /// TODO : Document
  void render(Canvas canvas) {
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

    hud.render(canvas);
  }

  /// TODO : Document
  void update(double t) {
    ctr += 1;
    final List<int> todelProjectiles = <int>[];
    final List<int> todelEnemies = <int>[];
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
      if (enemies[i].position.y > game.size.y) {
        todelEnemies.add(i);
      }
    }

    for (int i = todelEnemies.length - 1; i >= 0; i--) {
      enemies.removeAt(todelEnemies[i]);
    }
    if (ctr >= 10) {
      // HACKS
      final List<String> colors = <String>[
        'pink',
        'orange',
        'yellow',
        'blue',
        'black'
      ];
      enemies.add(
        Enemy(
          enemyImage: game.images
              .fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),
          startPos: Vector2(
              min(Random().nextDouble() * game.size.x, game.size.x - 50),
              -50.0),
        ),
      );
    }
    if (ctr >= 10) {
      ctr = 0;
      projectiles.add(
        Projectile(
          projectileImage: game.images.fromCache('laserRed01.png'),
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
    final List<int> todelProjectile = <int>[];
    for (int i = 0; i < projectiles.length; i++) {
      final List<int> todelEnemy = <int>[];
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
  void handleTapDown(TapDownDetails d) {
    isTouching = true;
    final double screenCenterX = game.size.x / 2;
    isLeft = d.globalPosition.dx < screenCenterX;
  }

  /// TODO : Document
  void handleTapUp(TapUpDetails tapUpDetails) {
    isTouching = false;
  }
}
