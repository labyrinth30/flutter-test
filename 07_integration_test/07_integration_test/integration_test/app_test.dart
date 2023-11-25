import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_guide/main.dart';

void main() {
  // 초기화해줘야함
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // 보통 end-to-end 테스트라고 함
  group('end-to-end', () {
    testWidgets('floatingActionButton을 탭하면 증가해야함', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);

      final fab = find.byTooltip("Increment");
      await tester.tap(fab);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
