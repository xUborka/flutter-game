import 'package:flame/game/game_widget.dart';
import 'package:flutter_game/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() async {
  BoxGame _game = BoxGame();
  runApp(GameWidget(game: _game,));
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
}