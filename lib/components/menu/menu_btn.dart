// import 'package:flame/anchor.dart';
// import 'package:flame/components/component.dart';
// import 'package:flame/sprite.dart';
// import 'package:flame/text_config.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_game/game.dart';

// /// TODO : Document What happens here
// class MenuButton extends PositionComponent {
//   /// TODO : Document
//   SpaceGame game;

//   /// TODO : Document
//   Sprite img;

//   /// TODO : Document
//   bool tapped;

//   String text;

//   /// TODO : Document
//   TextConfig ingameTextConfig = TextConfig(color: Colors.white, fontSize: 36.0, fontFamily: 'Ethnocentric');

//   /// TODO : Document
//   MenuButton(this.game, this.img, this.text) {
//     tapped = false;
//     x = 0;
//     y = 0;
//     width = 0;
//     height = 0;
//   }

//   @override
//   void render(Canvas c) {
//     c.save();
//     // HACK : Look into why this is needed
//     img.src = Rect(0, 0, 0, 0);
//     img.render(c, position: position, size: size);
//     // TODO : -3 is needed because of the shadow below the image. Find a nicer way.
//     final Vector2 midPos = Vector2(position.x+size.x/2,position.y+size.y/2-3);
//     ingameTextConfig.render(c, text, midPos, anchor: Anchor.center);
//     super.render(c);
//     c.restore();
//   }

//   /// TODO : Document
//   void onTapDown(TapDownDetails d) {
//   }

//   /// TODO : Document
//   void onTapUp(TapUpDetails d) {
//   }
// }
