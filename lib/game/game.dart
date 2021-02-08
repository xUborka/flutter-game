import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/components/hud.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/managers/audio_manager.dart';

import 'components/background.dart';

class SpaceGame extends BaseGame with TapDetector {
  Hud hud;
  Background bg;
  
  SpaceGame() {
    add(bg = Background());
    add(hud = Hud());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (details.globalPosition.dx < size.width / 2.0) {
    }
  }

  @override
  void onTapUp(TapUpDetails details) {
  }

}
