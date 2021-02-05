import 'package:flame/flame.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/sprite.dart';

class WidgetsAssets {
  static SpriteSheet _buttons;
  static SpriteSheet _special_button;

  static Future<void> load() async {
    await Flame.images.loadAll(['test_buttons.png', 'special-button.png']);
    _buttons = SpriteSheet(
        imageName: 'test_buttons.png',
        textureHeight: 20,
        textureWidth: 60,
        columns: 2,
        rows: 2);
    _special_button = SpriteSheet(
        imageName: 'special-button.png',
        textureHeight: 40,
        textureWidth: 60,
        columns: 1,
        rows: 2);
  }
}

class ButtonSprites {
  static Sprite primaryButton() => WidgetsAssets._buttons.getSprite(0, 0);
  static Sprite primaryButtonPressed() =>
      WidgetsAssets._buttons.getSprite(1, 0);

  static Sprite secondaryButton() => WidgetsAssets._buttons.getSprite(0, 1);
  static Sprite secondaryButtonPressed() => WidgetsAssets._buttons.getSprite(1, 1);

  static Sprite specialButton() => WidgetsAssets._special_button.getSprite(0, 0);
  static Sprite specialButtonPressed() => WidgetsAssets._special_button.getSprite(1, 0);
}
