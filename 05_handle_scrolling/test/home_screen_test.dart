import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handle_scrolling/main.dart';

void main() {
  testWidgets('list test', (tester) async {
    // 테스트할 화면은 HomeScreen이지만, 그대로 적으면 에러가 남
    // MaterialApp을 적어줘야함
    await tester.pumpWidget(const MyApp());

    // Scrollerable 넣음
    final listFinder = find.byType(Scrollable);
    // 50번째 아이템을 찾음(key는 home_screen.dart에 있음)
    final itemFinder = find.byKey(const ValueKey("item_50_text"));

    // itemFinder를 찾을 때 까지 스크롤할 건데
    // delta는 double 값임
    // scrollable은 listFinder에서 찾겠다는 의미
    await tester.scrollUntilVisible(
      itemFinder,
      100.0,
      scrollable: listFinder,
    );

    // 실제로 찾았는지 확인
    expect(
      itemFinder,
      findsOneWidget,
    );
  });
}
