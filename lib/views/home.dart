import 'dart:ui';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game.dart';

class HomeView {
  final BoxGame game;
  double btnWidth;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.game){
    btnWidth = game.size.x * 0.65;
  }

  void render(Canvas c) {
    game.background.render(
      c,
      position: Vector2(0, 0),
      size: game.size
    );
    game.start.position = Vector2(game.size.x/2-btnWidth/2, game.size.y/2 - 100);
    game.start.size = Vector2(btnWidth, btnWidth/3);
    game.start.render(c);
    game.exit.render(
      c,
      position: Vector2(game.size.x/2-btnWidth/2, game.size.y/2 + 0),
      size: Vector2(btnWidth, btnWidth/3)
    );
  }

  void update(double t) {}
}