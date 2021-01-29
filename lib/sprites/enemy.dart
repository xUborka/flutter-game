// import 'dart:ui';
// import 'package:flame/components/sprite_component.dart';
// import 'package:flame/extensions/vector2.dart';
// import 'package:flame/sprite.dart';

// /// TODO : Document
// class Enemy extends SpriteComponent {
//   /// TODO : Document
//   double speed;

//   /// TODO : Document
//   Enemy({Image enemyImage, Vector2 startPos})
//       : super.fromSprite(Vector2(50.0, 50.0), Sprite(enemyImage)) {
//     position = startPos;
//     speed = 1.5;
//   }

//   @override
//   void render(Canvas c) {
//     c.save();
//     // HACK : Look into why this is needed
//     sprite.render(c, position: position, size: size);
//     super.render(c);
//     c.restore();
//   }

//   @override
//   void update(double dt) {
//     // Unnecessary override!
//     super.update(dt);
//   }

//   /// TODO : Document
//   void move() {
//     position.y += speed;
//   }
// }
