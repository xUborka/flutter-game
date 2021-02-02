import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/components/hud.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/managers/audio_manager.dart';
import 'package:flutter_game/sprites/enemy.dart';
import 'package:flutter_game/sprites/projectile.dart';
import 'package:flutter_game/sprites/ship.dart';

class SpaceGame extends BaseGame with TapDetector {
  Hud hud;
  Ship ship;
  Sprite background;
  int score = 0;
  int time = 0;
  int ctr = 0;
  List<Projectile> projectiles = <Projectile>[];
  List<Enemy> enemies = <Enemy>[];
  bool isLeft = false;
  bool isTouching = false;

  SpaceGame() {
    background = MiscSprites.background();

    add(ship = Ship(MiscSprites.ship()));

    add(hud = Hud());
  }

  @override
  void render(Canvas canvas) {
    // Dummy Background
    final Paint opacityPaint = Paint()..color = Colors.white.withOpacity(0.2);
    background.render(
      canvas,
      width: size.width,
      height: size.height,
      overridePaint: opacityPaint,
    );
    // // Projectiles
    projectiles.forEach((Projectile projectile) => projectile.render(canvas));
    enemies.forEach((Enemy enemy) => enemy.render(canvas));
    super.render(canvas);
  }

  @override
  void update(double t) {
    // Full hack, refactor
    ctr += 1;
    final List<int> todelEnemies = <int>[];
    enemies.forEach((Enemy enemy) => enemy.move());
    for (int i = 0; i < enemies.length; i++) {
      if (enemies[i].y > size.height) {
        todelEnemies.add(i);
      }
    }

    for (int i = todelEnemies.length - 1; i >= 0; i--) {
      enemies.removeAt(todelEnemies[i]);
    }
    final List<int> todelProjectiles = <int>[];
    for (int i = 0; i < projectiles.length; i++) {
      projectiles[i].move();
      if (projectiles[i].y <= -54) {
        todelProjectiles.add(i);
      }
    }

    for (int i = todelProjectiles.length - 1; i >= 0; i--) {
      projectiles.removeAt(todelProjectiles[i]);
    }
    if (ctr % 25 == 0) {
      projectiles.add(Projectile(MiscSprites.projectile(), Position(ship.x + (ctr % 50 == 0 ? 12 : 30), ship.y - 10)));
      AudioManager.blast2Sfx();
    }
    if (ctr >= 50) {
      score += 1;
      Enemy tEnemy = Enemy(EnemySprites.blueEnemy());
      tEnemy.setByPosition(Position(min(Random().nextDouble() * size.width, size.width - 50), -32));
      enemies.add(tEnemy);
      ctr = 0;
    }
    if (isTouching) {
      ship.move(toLeft: isLeft);
    }

    // Test projectile impact
    bamm();
  }

  void bamm() {
    final List<int> todelProjectile = <int>[];
    for (int i = 0; i < projectiles.length; i++) {
      final List<int> todelEnemy = <int>[];
      for (int j = 0; j < enemies.length; j++) {
        final Projectile crntProjectile = projectiles[i];
        final Enemy crntEnemy = enemies[j];
        final Offset peakPoint = Offset(crntProjectile.x + crntProjectile.width / 2.0, crntProjectile.y);
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

  @override
  void onTapDown(TapDownDetails details) {
    isTouching = true;
    final double screenCenterX = size.width / 2.0;
    isLeft = details.globalPosition.dx < screenCenterX;
  }

  @override
  void onTapUp(TapUpDetails details) {
    isTouching = false;
  }

  // @override
  // void onTapCancel() {
  //   isTouching = false;
  // }
}
