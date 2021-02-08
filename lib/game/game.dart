import 'package:flame/components/animation_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/game/components/hud.dart';
import 'package:flutter_game/game/game_assets.dart';
import 'package:flutter_game/managers/audio_manager.dart';

import 'components/background.dart';

class SpaceGame extends BaseGame with TapDetector {
  Hud hud;
  Background bg;
  AnimationComponent player;
  SpaceGame() {
    add(bg = Background());
    add(player = AnimationComponent(50, 50, HeartSprites.idle())..setByPosition(Position(100, 100)));
    add(AnimationComponent(50, 50, HeartSprites.run())..setByPosition(Position(150, 100)));
    add(hud = Hud());
  }

  // @override
  // void render(Canvas canvas) {
  //   super.render(canvas);
  // }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  // }

  @override
  void onTapDown(TapDownDetails details) {
    // if (details.globalPosition.dx < size.width / 2.0) {
    // }
  }

  @override
  void onTapUp(TapUpDetails details) {
  }

}
