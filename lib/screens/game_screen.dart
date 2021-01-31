import 'package:flutter/material.dart';
import 'package:flutter_game/game/game.dart';

// TODO : Pontosan hol legyen a hatar Flutter es Flame kozott
class GameScreen extends StatelessWidget {
  SpaceGame game;
  GameScreen(){
    game = SpaceGame();
  }
  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
