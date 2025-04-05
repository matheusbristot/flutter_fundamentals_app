import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/fundamentals_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FundamentalsApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Add'), findsNothing);
    expect(find.text('List'), findsNothing);
  });

  testWidgets(
      'When counter pressed three times should be show bottomtabbar with two items',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FundamentalsApp());

    // Act
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify
    expect(find.text('Add'), findsOneWidget);
    expect(find.text('List'), findsOneWidget);
  });

  testWidgets(
      'When counter pressed three times should be show bottomtabbar and click List swap to another screen and hidden add button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FundamentalsApp());

    // Act
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();

    // Verify
    expect(find.text('List Page'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
  });
}
