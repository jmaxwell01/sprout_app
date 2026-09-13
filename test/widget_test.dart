import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sprout_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SproutApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Pick a Date button opens the date entry screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SproutApp());

    expect(find.text('No date selected yet'), findsOneWidget);

    await tester.tap(find.text('Pick a Date'));
    await tester.pumpAndSettle();

    expect(find.text('Select a Date'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}
