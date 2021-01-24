import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game.dart';

class Hud {
  /// TODO : Document
  SpaceGame game;

  /// TODO : Document
  TextConfig ingameTextConfig = TextConfig(color: Colors.white);

  /// TODO : Document
  Hud(this.game);

  /// TODO : Document
  void render(Canvas c) {
    c.save();
    // HACK : Look into why this is needed
    ingameTextConfig.render(c, 'Score : ${game.gameView.score}', Vector2(0, 0));
    c.restore();
  }
}
