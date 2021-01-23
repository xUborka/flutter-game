import 'package:flame/game/game_widget.dart';
import 'package:flutter_game/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// TODO : Document
Future<void> main() async {
  final SpaceGame _game = SpaceGame();
  runApp(GameWidget(game: _game));
  final Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
}
