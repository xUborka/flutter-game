import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game.dart';

class Hud {
  /// TODO : Document
  SpaceGame game;

  /// TODO : Document
  TextConfig ingameTextConfig = TextConfig(color: Colors.white);
  Sprite a;
  Sprite b;
  Sprite c;
  Sprite d;

  /// TODO : Document
  Hud(this.game) {
    a = Sprite(game.images.fromCache('HealthBar/background.png'));
    b = Sprite(game.images.fromCache('HealthBar/border.png'));
    c = Sprite(game.images.fromCache('HealthBar/heart.png'));
    d = Sprite(game.images.fromCache('HealthBar/half.png'));
  }

  /// TODO : Document
  void render(Canvas canvas) {
    ingameTextConfig.render(canvas, 'Score : ${game.gameView.score}', Vector2(game.size.x-150, 10));
    // ingameTextConfig.render(
    //   c,
    //   'Time : ${game.gameView.time}',
    //   Vector2(game.size.x - 150, 0),
    // );

    // TODO HACK Ugly bitch ass code, just to see how it looks
    for (int i = 0; i < 5; i++){
      a.render(canvas, position: Vector2(2+i.toDouble()*35,2), size: Vector2(35, 35));
      b.render(canvas, position: Vector2(2+i.toDouble()*35,2), size: Vector2(35, 35));
      if (i < 3){
        c.render(canvas, position: Vector2(2+i.toDouble()*35,2), size: Vector2(35, 35));
      }
      if (i == 3){
        d.render(canvas, position: Vector2(2+i.toDouble()*35,2), size: Vector2(35, 35));
      }
    }
  }
}
