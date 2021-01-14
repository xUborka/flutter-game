import 'dart:ui';
import 'dart:math' as math;
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game with TapDetector{
  Color clr = Color(0xffffffff);
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
    boxPaint.color = clr;
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = size.x / 2;
    double screenCenterY = size.y / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
      && d.globalPosition.dx <= screenCenterX + 75
      && d.globalPosition.dy >= screenCenterY - 75
      && d.globalPosition.dy <= screenCenterY + 75
    ) {
      clr = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    }
}

}