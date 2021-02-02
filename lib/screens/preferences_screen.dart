import 'package:flutter/material.dart';

import '../widgets/label.dart';
import '../widgets/pattern_container.dart';

class PreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return PatternContainer(
        child: Center(
      child: Column(children: [
        SizedBox(height: 40),
        Label(label: 'TODO PREFERENCES', fontSize: 60, fontColor: Color(0xFFe3e3e3)),
      ]),
    ));
  }
}
