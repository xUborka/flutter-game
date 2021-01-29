import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback onPress;
  final VoidCallback onPressReleased;
  final String label;

  final double width;
  final double height;
  Button(
      {this.label,
      this.onPressed,
      this.onPress,
      this.onPressReleased,
      this.width = 300.0,
      this.height = 80.0});

  @override
  State<StatefulWidget> createState() => _ButtonState();
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
    widget.onPress?.call();
    setState(() {
      _pressed = false;
    });
    widget.onPressReleased?.call();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = widget.width;
    final double _height = widget.height;
    return GestureDetector(
      onTap: () => _press(),
      onTapUp: (_) => _release(),
      onTapCancel: () => _release(),
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _pressed
                ? AssetImage('assets/images/Menu/Empty_BTN.png') // TODO OnPressAnimation
                : AssetImage('assets/images/Menu/Empty_BTN.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Ethnocentric',
              fontSize: _height * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
