import 'package:flame/flame.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/sprite.dart';

class WidgetsAssets {
  static SpriteSheet _buttons;
  static SpriteSheet _specialButton;
  static SpriteSheet _navLeft;
  static SpriteSheet _navRight;
  static SpriteSheet _navMid;

  static Future<void> load() async {
    await Flame.images.loadAll(['test_buttons.png', 'special-button.png']);
    _buttons = SpriteSheet(
        imageName: 'test_buttons.png',
        textureHeight: 20,
        textureWidth: 60,
        columns: 2,
        rows: 2);
    _specialButton = SpriteSheet(
        imageName: 'special-button.png',
        textureHeight: 40,
        textureWidth: 60,
        columns: 1,
        rows: 2);
    _navLeft = SpriteSheet(
        imageName: 'navbar_left.png',
        textureHeight: 100,
        textureWidth: 100,
        columns: 1,
        rows: 1);
    _navRight = SpriteSheet(
        imageName: 'navbar_right.png',
        textureHeight: 100,
        textureWidth: 100,
        columns: 1,
        rows: 1);
    _navMid = SpriteSheet(
        imageName: 'navbar_mid.png',
        textureHeight: 100,
        textureWidth: 200,
        columns: 1,
        rows: 1);
  }
}

class ButtonSprites {
  static Sprite primaryButton() => WidgetsAssets._buttons.getSprite(0, 0);
  static Sprite primaryButtonPressed() =>
      WidgetsAssets._buttons.getSprite(1, 0);

  static Sprite secondaryButton() => WidgetsAssets._buttons.getSprite(0, 1);
  static Sprite secondaryButtonPressed() => WidgetsAssets._buttons.getSprite(1, 1);

  static Sprite specialButton() => WidgetsAssets._specialButton.getSprite(0, 0);
  static Sprite specialButtonPressed() => WidgetsAssets._specialButton.getSprite(1, 0);
  static Sprite navMid() => WidgetsAssets._navMid.getSprite(0, 0);
  static Sprite navLeft() => WidgetsAssets._navLeft.getSprite(0, 0);
  static Sprite navRight() => WidgetsAssets._navRight.getSprite(0, 0);
}
