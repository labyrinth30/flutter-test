// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:find_widgets/main.dart';

void main() {
  testWidgets(
    'Counter increments smoke test',
    (WidgetTester tester) async {
      const testKey = Key('K');

      await tester.pumpWidget(
        const MaterialApp(
          // 키 전달
          key: testKey,
          home: Scaffold(
            body: Text('Hello World'),
          ),
        ),
      );

      expect(
        find.byKey(testKey),
        findsOneWidget,
      );
    },
  );
}
