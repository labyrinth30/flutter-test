import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_simple/counter.dart';

void main() {
  group('Counter', () {
    // Counter 객체의 value가 0으로 시작하는지 확인
    test('0으로 시작해야한다.', () {
      expect(Counter().value, 0);
    });
    test('value 값이 1 증가해야한다.', () {
      // 준비
      final counter = Counter();
      // 실행
      counter.countUp();
      // 예측
      expect(counter.value, 1);
    });
    test('value 값이 1 감소해야한다.', () {
      // 준비
      final counter = Counter();
      // 실행
      counter.countDown();
      // 예측
      expect(counter.value, -1);
    });
    test('value 값이 0으로 초기화 되어야한다.', () {
      // 준비
      final counter = Counter();
      // 실행
      counter.countUp();
      counter.countUp();
      counter.countUp();
      counter.clear();
      // 예측
      expect(counter.value, 0);
    });
  });
}
