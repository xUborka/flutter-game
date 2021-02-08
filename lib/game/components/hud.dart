import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/game.dart';
import 'package:flutter_game/game/game_assets.dart';

class Hud extends Component with HasGameRef<SpaceGame> {
  TextConfig ingameTextConfig = TextConfig(color: Colors.white);
  Sprite a;
  Sprite b;
  Sprite c;
  Sprite d;

  Hud() {
    a = HeartSprites.heartBorder();
    b = HeartSprites.heartBackground();
    c = HeartSprites.heartFull();
    d = HeartSprites.heartHalf();
  }

  @override
  void render(Canvas canvas) {
    // ingameTextConfig.render(canvas, 'Score : ${gameRef.score}', Position(gameRef.size.width-150, 2));

    // TODO HACK Ugly bitch ass code, just to see how it looks
    for (int i = 0; i < 4; i++){
      a.renderRect(canvas, Rect.fromLTWH(2+i.toDouble()*35,2, 32, 32));
      b.renderRect(canvas, Rect.fromLTWH(2+i.toDouble()*35,2, 32, 32));
      if (i < 2){
        c.renderRect(canvas, Rect.fromLTWH(2+i.toDouble()*35,2, 32, 32));
      }
      if (i == 2){
        d.renderRect(canvas, Rect.fromLTWH(2+i.toDouble()*35,2, 32, 32));
      }
    }
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
