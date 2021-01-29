import 'package:flame/flame.dart';

class Assets {
  static Future<void> load() async {
    await Flame.images.loadAll([
      'ship_test.png',
      'laserRed01.png',
      'HealthBar/background.png',
      'HealthBar/border.png',
      'HealthBar/heart.png',
      'HealthBar/half.png',
      'Enemies/black_enemy.png',
      'Enemies/blue_enemy.png',
      'Enemies/orange_enemy.png',
      'Enemies/pink_enemy.png',
      'Enemies/yellow_enemy.png',
      'Menu/BG.png',
      'Menu/Empty_BTN.png'
    ]);
  }
}
