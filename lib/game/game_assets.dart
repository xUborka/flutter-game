import 'package:flame/flame.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/sprite.dart';

class GameAssets {
  static SpriteSheet _hearts;

  static Future<void> load() async {
    await Flame.images.loadAll([
      'HealthBar/heart-tileset-01.png',
    ]);
    _hearts = SpriteSheet(
        imageName: 'HealthBar/heart-tileset-01.png',
        textureHeight: 32,
        textureWidth: 32,
        columns: 2,
        rows: 2);
  }
}

class HeartSprites {
  static Sprite heartBorder() => GameAssets._hearts.getSprite(0, 0);
  static Sprite heartBackground() => GameAssets._hearts.getSprite(0, 1);

  static Sprite heartFull() => GameAssets._hearts.getSprite(1, 0);
  static Sprite heartHalf() => GameAssets._hearts.getSprite(1, 1);
}
