import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/components/hud.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/sprites/enemy.dart';

class SpaceGame extends BaseGame with TapDetector {
  Hud hud;
  // Ship ship;
  Sprite background;
  int score = 0;
  int time = 0;
  int ctr = 0;
  // List<Projectile> projectiles = <Projectile>[];
  List<Enemy> enemies = <Enemy>[];
  bool isLeft = false;
  bool isTouching = false;

  SpaceGame() {
    background = MiscSprites.background();

    // ship = Ship(
    //   game: game,
    //   shipImage: game.images.fromCache('ship_test.png'),
    //   speed: 5,
    // );

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
    // // Ship
    // ship.render(canvas);
    // // Projectiles
    // projectiles.forEach((Projectile projectile) => projectile.render(canvas));
    enemies.forEach((Enemy enemy) => enemy.render(canvas));
    super.render(canvas);

    // hud.render(canvas);
  }

  @override
  void update(double t) {
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
    if (ctr >= 50) {
      score += 1;
      Enemy tEnemy = Enemy(EnemySprites.blueEnemy());
      tEnemy.setByPosition(Position(min(Random().nextDouble() * size.width, size.width - 50), -32));
      enemies.add(tEnemy);
      ctr = 0;
    }
  }
  //   //random time incrementation
  //   time += 1;
  //   final List<int> todelProjectiles = <int>[];
  // final List<int> todelEnemies = <int>[];
  //   for (int i = 0; i < projectiles.length; i++) {
  //     projectiles[i].move();
  //     if (projectiles[i].position.y <= -54) {
  //       todelProjectiles.add(i);
  //     }
  //   }

  //   for (int i = todelProjectiles.length - 1; i >= 0; i--) {
  //     projectiles.removeAt(todelProjectiles[i]);
  //   }
  // enemies.forEach((Enemy enemy) => enemy.move());
  // for (int i = 0; i < enemies.length; i++) {
  //   if (enemies[i].position.y > game.size.y) {
  //     todelEnemies.add(i);
  //   }
  // }

  // for (int i = todelEnemies.length - 1; i >= 0; i--) {
  //   enemies.removeAt(todelEnemies[i]);
  // }
  // if (ctr >= 10) {
  //   // HACKS
  //   final List<String> colors = <String>[
  //     'pink',
  //     'orange',
  //     'yellow',
  //     'blue',
  //     'black'
  //   ];
  //   enemies.add(
  //     Enemy(
  //       enemyImage: game.images
  //           .fromCache('Enemies/${colors[Random().nextInt(5)]}_enemy.png'),
  //       startPos: Vector2(
  //           min(Random().nextDouble() * game.size.x, game.size.x - 50),
  //           -50.0),
  //     ),
  //   );
  // }
  //   if (ctr >= 10) {
  //     ctr = 0;
  //     projectiles.add(
  //       Projectile(
  //         projectileImage: game.images.fromCache('laserRed01.png'),
  //         startPos: Vector2(ship.position.x + 21, ship.position.y - 50),
  //         speed: 10.0,
  //       ),
  //     );
  //   }
  //   // Test projectile impact
  //   bamm();

  //   if (isTouching) {
  //     ship.move(toLeft: isLeft);
  //   }
  // }

  // void bamm() {
  //   final List<int> todelProjectile = <int>[];
  //   for (int i = 0; i < projectiles.length; i++) {
  //     final List<int> todelEnemy = <int>[];
  //     for (int j = 0; j < enemies.length; j++) {
  //       final Projectile crntProjectile = projectiles[i];
  //       final Enemy crntEnemy = enemies[j];
  //       final Offset peakPoint = Offset(
  //           crntProjectile.position.x + crntProjectile.size.x / 2.0,
  //           crntProjectile.position.y);
  //       if (crntEnemy.toRect().contains(peakPoint)) {
  //         todelEnemy.add(j);
  //         todelProjectile.add(i);
  //       }
  //     }
  //     for (int k = todelEnemy.length - 1; k >= 0; k--) {
  //       if (enemies.length > todelEnemy[k]) {
  //         enemies.removeAt(todelEnemy[k]);
  //         score += 10;
  //       }
  //     }
  //   }
  //   for (int i = todelProjectile.length - 1; i >= 0; i--) {
  //     if (projectiles.length > todelProjectile[i]) {
  //       projectiles.removeAt(todelProjectile[i]);
  //     }
  //   }
  // }

  void handleTapDown(TapDownDetails d) {
    isTouching = true;
    final double screenCenterX = size.width / 2.0;
    isLeft = d.globalPosition.dx < screenCenterX;
  }

  void handleTapUp(TapUpDetails tapUpDetails) {
    isTouching = false;
  }
}
