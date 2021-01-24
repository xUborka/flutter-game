import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/components/menu/back_btn.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document
class OptionsView {
  /// TODO : Document
  final SpaceGame game;

  /// TODO : Document
  double btnWidth;

  /// TODO : Document
  BackButton backButton;

  /// TODO : Document
  OptionsView(this.game) {
    btnWidth = game.size.x * 0.65;

    backButton = BackButton(
      game,
      Sprite(game.images.fromCache('Menu/Back_BTN.png')),
    );
  }

  /// TODO : Document
  void handleTapDown(TapDownDetails d) {
    if (backButton.toRect().contains(d.globalPosition)) {
      backButton.onTapDown(d);
    }
  }

  /// TODO : Document
  void handleTapUp(TapUpDetails tapUpDetails) {
    if (backButton.toRect().contains(tapUpDetails.globalPosition)) {
      backButton.onTapUp(tapUpDetails);
    }

    backButton.tapped = false;
  }

  /// TODO : Document
  void render(Canvas c) {
    // Background
    // HACK: Wrong background, should not use this one
    //       or at least reference it differently
    game.gameView.background
        .render(c, position: Vector2(0, 0), size: game.size);

    // Exit
    backButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 + 0,
    );
    backButton.size = Vector2(btnWidth, btnWidth / 3);
    backButton.render(c);
  }

  /// TODO : Document
  void update(double t) {
    // Do Nothing
  }
}
