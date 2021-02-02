import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

// TODO Separate file
class SineCurve extends Curve {
  final double freq;
  final double scale;

  SineCurve({this.freq = 1, this.scale = 1});

  @override
  double transformInternal(double t) {
    return sin(freq * 2 * pi * t) * scale;
  }
}

class Enemy extends SpriteComponent {
  double speed;
  double t;
  final SineCurve curve = SineCurve(); // TODO Argument
  Enemy(Sprite sp) : super.fromSprite(50, 50, sp) {
    t = 0;
    speed = 180;
  }

  @override
  void render(Canvas c) {
    c.save();
    super.render(c);
    c.restore();
  }

  @override
  void update(double dt) {
    t = (t + dt) % 1.0;
    x += curve.transform(t);
    y += speed * dt;
    super.update(dt);
  }

}
