import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import './assets.dart';
import './label.dart';

enum ButtonType { PRIMARY, SECONDARY, SPECIAL }

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback onPress;
  final VoidCallback onPressReleased;
  final String label;
  final ButtonType buttonType;

  double width;
  double height;
  final bool disabled;

  Button({
    this.onPressed,
    this.onPress,
    this.onPressReleased,
    this.label,
    this.buttonType,
    this.width,
    this.height,
    this.disabled = false,
  });

  @override
  State createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  void _press() {
    widget.onPress?.call();
    setState(() {
      _pressed = true;
    });
  }

  void _release() {
    setState(() {
      _pressed = false;
    });

    widget.onPressReleased?.call();
    widget.onPressed?.call();
  }

  @override
  Widget build(_) {
    widget.width = widget.width ?? 200;
    widget.height = widget.height ?? 50;

    Sprite _sprite;
    Sprite _pressedSprite;
    Color _labelColor;

    switch (widget.buttonType) {
      case ButtonType.PRIMARY:
        {
          _labelColor = Color.fromRGBO(34, 32, 52, 1);
          _sprite = ButtonSprites.primaryButton();
          _pressedSprite = ButtonSprites.primaryButtonPressed();
          break;
        }
      case ButtonType.SECONDARY:
        {
          _labelColor = Color.fromRGBO(34, 32, 52, 1);
          _sprite = ButtonSprites.secondaryButton();
          _pressedSprite = ButtonSprites.secondaryButtonPressed();
          break;
        }
      case ButtonType.SPECIAL:
        {
          widget.height = 100;
          _labelColor = Color.fromRGBO(34, 32, 52, 1);
          _sprite = ButtonSprites.specialButton();
          _pressedSprite = ButtonSprites.specialButtonPressed();
          break;
        }
    }

    return Opacity(
      opacity: widget.disabled ? 0.3 : 1,
      child: GestureDetector(
        onTapDown: (_) {
          if (widget.disabled) {
            return;
          }
          _press();
        },
        onTapUp: (_) {
          if (widget.disabled) {
            return;
          }
          _release();
        },
        onTapCancel: () {
          if (widget.disabled) {
            return;
          }
          _release();
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: _ButtonPainer(_pressed ? _pressedSprite : _sprite),
            child: Padding(
              padding: EdgeInsets.only(bottom: _pressed ? 0 : 10),
              child: Center(
                child: widget.label != null
                    ? Label(
                        label: widget.label,
                        fontColor: _labelColor,
                        fontSize: widget.height * 0.4,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPainer extends CustomPainter {
  final Sprite _sprite;

  _ButtonPainer(this._sprite);

  @override
  bool shouldRepaint(_ButtonPainer old) => old._sprite != _sprite;

  @override
  void paint(Canvas canvas, Size size) {
    _sprite.renderRect(canvas, Rect.fromLTWH(0, 0, size.width, size.height));
  }
}
