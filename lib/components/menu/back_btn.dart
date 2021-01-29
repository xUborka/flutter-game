// import 'dart:ui';

// import 'package:flame/sprite.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flame/components/mixins/tapable.dart';
// import 'package:flutter_game/components/menu/menu_btn.dart';
// import 'package:flutter_game/game.dart';
// import 'package:flutter_game/view.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_game/generated/locale_keys.g.dart';

// /// TODO : Document
// class BackButton extends MenuButton with Tapable {
//   /// TODO : Document
//   BackButton(SpaceGame game, Sprite img)
//       : super(game, img, LocaleKeys.back.tr());
  

//   @override
//   void onTapDown(TapDownDetails d) {
//     tapped = true;
//   }

//   @override
//   void onTapUp(TapUpDetails d) {
//     if (tapped) {
//       game.activeView = View.home;
//     }
//   }

//   @override
//   Rect toRect() {
//     // TODO: implement toRect
//     throw UnimplementedError();
//   }
// }
