import 'dart:ui';
import 'package:flame/game.dart';

class BoxGame extends Game {
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, size.x, size.y);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);
    double screenCenterX = size.x / 2;
    double screenCenterY = size.y / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150
    );
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }

}