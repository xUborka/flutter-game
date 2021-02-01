import 'package:flame/flame.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/sprite.dart';

class GameAssets {
  static SpriteSheet _hearts;
  static SpriteSheet _enemies;
  static Sprite _background;
  static Sprite _ship;
  static Sprite _projectile;

  static Future<void> load() async {
    await Flame.images.loadAll([
      'HealthBar/heart-tileset-01.png',
      'Enemies/enemy-tileset-01.png',
      'Menu/BG.png',
      'ship_test.png',
      'laserRed01.png'
    ]);
    _hearts = SpriteSheet(
        imageName: 'HealthBar/heart-tileset-01.png',
        textureHeight: 32,
        textureWidth: 32,
        columns: 2,
        rows: 2);
    _enemies = SpriteSheet(
        imageName: 'Enemies/enemy-tileset-01.png',
        textureHeight: 32,
        textureWidth: 32,
        columns: 2,
        rows: 3);
    _background = Sprite('Menu/BG.png');
    _ship = Sprite('ship_test.png');
    _projectile = Sprite('laserRed01.png');
  }
}

class EnemySprites {
  static Sprite blackEnemy() => GameAssets._enemies.getSprite(0, 0);
  static Sprite blueEnemy() => GameAssets._enemies.getSprite(0, 1);

  static Sprite greenEnemy() => GameAssets._enemies.getSprite(1, 0);
  static Sprite orangeEnemy() => GameAssets._enemies.getSprite(1, 1);

  static Sprite pinkEnemy() => GameAssets._enemies.getSprite(2, 0);
  static Sprite yellowEnemy() => GameAssets._enemies.getSprite(2, 1);

}

class HeartSprites {
  static Sprite heartBorder() => GameAssets._hearts.getSprite(0, 0);
  static Sprite heartBackground() => GameAssets._hearts.getSprite(0, 1);

  static Sprite heartFull() => GameAssets._hearts.getSprite(1, 0);
  static Sprite heartHalf() => GameAssets._hearts.getSprite(1, 1);
}

class MiscSprites {
  static Sprite background() => GameAssets._background;
  static Sprite ship() => GameAssets._ship;
  static Sprite projectile() => GameAssets._projectile;
}