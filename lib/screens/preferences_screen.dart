import 'package:flutter/material.dart';

import '../widgets/label.dart';

class PreferencesScreen extends StatelessWidget {
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
          Label(
              label: 'TODO PREFERENCES',
              fontSize: 40,
              fontColor: Color(0xFFe3e3e3)),
        ]),
      ),
    );
  }
}
