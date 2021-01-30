import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_game/widgets/pattern_container.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

void main() {
  testWidgets('PatternContainer builds', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(PatternContainer()));

    final finder = find.byType(PatternContainer);
    expect(finder, findsOneWidget);
  });
}
