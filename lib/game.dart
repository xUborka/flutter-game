import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/view.dart';
import 'package:flutter_game/views/game_view.dart';
import 'package:flutter_game/views/home_view.dart';
import 'package:flutter_game/views/options_view.dart';

/// TODO : Document
class SpaceGame extends Game with TapDetector {
  /// TODO : Document
  HomeView homeView;

  /// TODO : Document
  GameView gameView;

  /// TODO : Document
  OptionsView optionsView;

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
        'HealthBar/background.png',
        'HealthBar/border.png',
        'HealthBar/heart.png',
        'HealthBar/half.png',
        'Enemies/black_enemy.png',
        'Enemies/blue_enemy.png',
        'Enemies/orange_enemy.png',
        'Enemies/pink_enemy.png',
        'Enemies/yellow_enemy.png',
        'Menu/BG.png',
        'Menu/Empty_BTN.png'
      ],
      (String image) async {
        await images.load(image);
      },
    );
    homeView = HomeView(this);
    gameView = GameView(this);
    optionsView = OptionsView(this);
  }

  /// TODO : Document
  @override
  void render(Canvas canvas) {
    switch (activeView) {
      case View.home:
        homeView.render(canvas);
        break;
      case View.game:
        gameView.render(canvas);
        break;
      case View.lost:
        // TODO: Handle this case.
        break;
      case View.options:
        optionsView.render(canvas);
        break;
    }
  }

  /// TODO : Document
  @override
  void update(double t) {
    switch (activeView) {
      case View.home:
        homeView.update(t);
        break;
      case View.game:
        gameView.update(t);
        break;
      case View.lost:
        // TODO: Handle this case.
        break;
      case View.options:
        optionsView.update(t);
        break;
    }
  }

  /// TODO : Document
  @override
  void onTapDown(TapDownDetails d) {
    switch (activeView) {
      case View.home:
        homeView.handleTapDown(d);
        break;
      case View.game:
        gameView.handleTapDown(d);
        break;
      case View.lost:
        // TODO: Handle this case.
        break;
      case View.options:
        optionsView.handleTapDown(d);
        break;
    }
  }

  /// TODO : Document
  @override
  void onTapUp(TapUpDetails d) {
    switch (activeView) {
      case View.home:
        homeView.handleTapUp(d);
        break;
      case View.game:
        gameView.handleTapUp(d);
        break;
      case View.lost:
        // TODO: Handle this case.
        break;
      case View.options:
        optionsView.handleTapUp(d);
        break;
    }
  }
}
