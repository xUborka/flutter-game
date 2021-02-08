import 'package:flutter/material.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';

class Background extends Component with Resizable {
  final Paint _paint = Paint()..color = const Color.fromRGBO(0, 0, 0, 1);

  @override
  void render(Canvas c) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    c.drawRect(rect, _paint);
  }

  @override
  void update(double t) {}
}