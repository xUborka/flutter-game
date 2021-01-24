import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/view.dart';
import 'package:flutter_game/views/game_view.dart';
import 'package:flutter_game/views/home_view.dart';

/// TODO : Document
class SpaceGame extends Game with TapDetector {
  /// TODO : Document
  HomeView homeView;

  /// TODO : Document
  GameView gameView;

  /// TODO : Document
  View activeView = View.home;

  /// TODO : Document
  SpaceGame();

  /// TODO : Global valamibe és úgy hivatkozni rá, nem stringként lejjebb
  @override
  Future<void> onLoad() async {
    await Future.forEach(
      <String>[
        'ship_test.png',
        'laserRed01.png',
        'Enemies/black_enemy.png',
        'Enemies/blue_enemy.png',
        'Enemies/orange_enemy.png',
        'Enemies/pink_enemy.png',
        'Enemies/yellow_enemy.png',
        'Menu/BG.png',
        'Menu/Start_BTN.png',
        'Menu/Exit_BTN.png'
      ],
      (String image) async {
        await images.load(image);
      },
    );
    homeView = HomeView(game: this);
    gameView = GameView(game: this);
  }

  /// TODO : Document
  @override
  void render(Canvas canvas) {
    if (activeView == View.home) {
      homeView.render(canvas);
    } else if (activeView == View.game) {
      gameView.render(canvas);
    }
  }

  /// TODO : Document
  @override
  void update(double t) {
    if (activeView == View.home) {
      homeView.update(t);
    } else if (activeView == View.game) {
      gameView.update(t);
    }
  }

  /// TODO : Document
  @override
  void onTapDown(TapDownDetails d) {
    if (activeView == View.home) {
      homeView.handleTapDown(d);
    } else if (activeView == View.game) {
      gameView.handleTapDown(d);
    }
  }

  /// TODO : Document
  @override
  void onTapUp(TapUpDetails tapUpDetails) {
    if (activeView == View.home) {
      homeView.handleTapUp(tapUpDetails);
    } else if (activeView == View.game) {
      gameView.handleTapUp(tapUpDetails);
    }
  }
}
