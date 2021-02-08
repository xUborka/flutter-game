import 'package:flame/animation.dart';
import 'package:flame/flame.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/sprite.dart';

class GameAssets {
  static SpriteSheet _hearts;
  static SpriteSheet _player;
  static Animation _playerIdle;
  static Animation _playerRunning;

  static Future<void> load() async {
    await Flame.images.loadAll([
      'HealthBar/heart-tileset-01.png',
      'among-us-01-Sheet.png',
    ]);
    _hearts = SpriteSheet(
        imageName: 'HealthBar/heart-tileset-01.png',
        textureHeight: 32,
        textureWidth: 32,
        columns: 2,
        rows: 2);
    _player = SpriteSheet(
        imageName: 'among-us-01-Sheet.png',
        textureHeight: 32,
        textureWidth: 32,
        columns: 6,
        rows: 1);
    _playerIdle = Animation.spriteList(
        [_player.getSprite(0, 0), _player.getSprite(0, 1)],
        stepTime: .2);
    _playerRunning = Animation.spriteList([
      _player.getSprite(0, 2),
      _player.getSprite(0, 3),
      _player.getSprite(0, 4),
      _player.getSprite(0, 5)
    ], stepTime: .15);
  }
}

class HeartSprites {
  static Sprite heartBorder() => GameAssets._hearts.getSprite(0, 0);
  static Sprite heartBackground() => GameAssets._hearts.getSprite(0, 1);

  static Sprite heartFull() => GameAssets._hearts.getSprite(1, 0);
  static Sprite heartHalf() => GameAssets._hearts.getSprite(1, 1);
  static Animation idle() => GameAssets._playerIdle;
  static Animation run() => GameAssets._playerRunning;
  // Sprite.fromImage();
}
