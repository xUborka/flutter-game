import 'package:flutter/material.dart';
import '../widgets/label.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/test_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(children: [
          SizedBox(height: 40),
          Label(label: 'TODO SHOP', fontSize: 60, fontColor: Color(0xFFe3e3e3)),
        ]),
      ),
    );
  }
}
