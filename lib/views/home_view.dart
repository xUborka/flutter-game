import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/components/menu/exit_btn.dart';
import 'package:flutter_game/components/menu/menu_btn.dart';
import 'package:flutter_game/components/menu/start_btn.dart';
import 'package:flutter_game/game.dart';

/// TODO : Document
class HomeView {
  /// TODO : Document
  final SpaceGame game;

  /// TODO : Document
  double btnWidth;

  /// TODO : Document
  MenuButton startButton;

  /// TODO : Document
  MenuButton exitButton;

  /// TODO : Document
  HomeView({this.game}) {
    btnWidth = game.size.x * 0.65;
    startButton = StartButton(
      game,
      Sprite(game.images.fromCache('Menu/Start_BTN.png')),
    );
    exitButton = ExitButton(
      game,
      Sprite(game.images.fromCache('Menu/Exit_BTN.png')),
    );
  }

  /// TODO : Document
  void handleTapDown(TapDownDetails d) {
    if (startButton.toRect().contains(d.globalPosition)) {
      startButton.onTapDown(d);
    } else if (exitButton.toRect().contains(d.globalPosition)) {
      exitButton.onTapDown(d);
    }
  }

  /// TODO : Document
  void handleTapUp(TapUpDetails tapUpDetails) {
    if (startButton.toRect().contains(tapUpDetails.globalPosition)) {
      startButton.onTapUp(tapUpDetails);
    } else if (exitButton.toRect().contains(tapUpDetails.globalPosition)) {
      exitButton.onTapUp(tapUpDetails);
    }
    startButton.tapped = false;
    exitButton.tapped = false;
  }

  /// TODO : Document
  void render(Canvas c) {
    // Background
    // HACK: Wrong background, should not use this one
    //       or at least reference it differently
    game.gameView.background.render(c, position: Vector2(0, 0), size: game.size);
    // Start
    startButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 - 100,
    );
    startButton.size = Vector2(btnWidth, btnWidth / 3);
    startButton.render(c);
    // Exit
    exitButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 + 0,
    );
    exitButton.size = Vector2(btnWidth, btnWidth / 3);
    exitButton.render(c);
  }

  /// TODO : Document
  void update(double t) {
    // Do Nothing
  }
}
