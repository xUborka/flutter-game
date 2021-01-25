import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/components/menu/exit_btn.dart';
import 'package:flutter_game/components/menu/menu_btn.dart';
import 'package:flutter_game/components/menu/options_btn.dart';
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
  MenuButton optionsButton;

  /// TODO : Document
  HomeView(this.game) {
    btnWidth = game.size.x * 0.65;
    startButton =
        StartButton(game, Sprite(game.images.fromCache('Menu/Empty_BTN.png')));
    exitButton =
        ExitButton(game, Sprite(game.images.fromCache('Menu/Empty_BTN.png')));
    optionsButton = OptionsButton(
        game, Sprite(game.images.fromCache('Menu/Empty_BTN.png')));
  }

  /// TODO : Document
  void handleTapDown(TapDownDetails d) {
    if (startButton.toRect().contains(d.globalPosition)) {
      startButton.onTapDown(d);
    } else if (exitButton.toRect().contains(d.globalPosition)) {
      exitButton.onTapDown(d);
    } else if (optionsButton.toRect().contains(d.globalPosition)) {
      optionsButton.onTapDown(d);
    }
  }

  /// TODO : Document
  void handleTapUp(TapUpDetails tapUpDetails) {
    if (startButton.toRect().contains(tapUpDetails.globalPosition)) {
      startButton.onTapUp(tapUpDetails);
    } else if (exitButton.toRect().contains(tapUpDetails.globalPosition)) {
      exitButton.onTapUp(tapUpDetails);
    } else if (optionsButton.toRect().contains(tapUpDetails.globalPosition)) {
      optionsButton.onTapUp(tapUpDetails);
    }

    startButton.tapped = false;
    exitButton.tapped = false;
    optionsButton.tapped = false;
  }

  /// TODO : Document
  void render(Canvas c) {
    // Background
    // HACK: Wrong background, should not use this one
    //       or at least reference it differently
    game.gameView.background
        .render(c, position: Vector2(0, 0), size: game.size);
    // Start
    startButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 - 100,
    );
    startButton.size = Vector2(btnWidth, btnWidth / 3);
    startButton.render(c);
    // Options
    optionsButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 + 0,
    );
    optionsButton.size = Vector2(btnWidth, btnWidth / 3);
    optionsButton.render(c);

    // Exit
    exitButton.position = Vector2(
      game.size.x / 2 - btnWidth / 2,
      game.size.y / 2 + 100,
    );
    exitButton.size = Vector2(btnWidth, btnWidth / 3);
    exitButton.render(c);
  }

  /// TODO : Document
  void update(double t) {
    // Do Nothing
  }
}
