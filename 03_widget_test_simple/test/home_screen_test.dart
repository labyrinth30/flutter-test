import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_simple/home_screen.dart';

void main() {
  testWidgets(
    'title, message가 잘 표시되어야한다',
    (widgetTester) async {
      // title: T, message: M이라고 전달이 잘 되어서 표시되는지 확인
      // 테스트할 HomeScreen은 Material Widget임
      // 그러므로 MaterialApp을 테스트 위젯으로 사용

      // 준비
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(
            title: 'T',
            message: 'M',
          ),
        ),
      );

      // T 글자가 있는 객체
      final titleFinder = find.text('T');
      // M 글자가 있는 객체
      final messageFinder = find.text('M');

      // 각각 한 개씩 있는 지 검사
      expect(
        titleFinder,
        findsOneWidget,
      );
      expect(
        messageFinder,
        findsOneWidget,
      );
    },
  );
}
