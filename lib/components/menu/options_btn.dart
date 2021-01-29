// import 'package:flame/sprite.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flame/components/mixins/tapable.dart';
// import 'package:flutter_game/components/menu/menu_btn.dart';
// import 'package:flutter_game/game.dart';
// import 'package:flutter_game/view.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_game/generated/locale_keys.g.dart';

// /// TODO : Document
// class OptionsButton extends MenuButton with Tapable {
//   /// TODO : Document
//   OptionsButton(SpaceGame game, Sprite img)
//       : super(game, img, LocaleKeys.options.tr());

//   @override
//   bool onTapDown(TapDownDetails d) {
//     tapped = true;
//     return true;
//   }

//   @override
//   bool onTapUp(TapUpDetails d) {
//     if (tapped) {
//       game.activeView = View.options;
//     }
//     return true;
//   }
// }
