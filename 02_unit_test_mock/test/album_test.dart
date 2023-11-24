import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:unit_test_mock/album.dart';

void main() {
  group('fetchAlbum', () {
    test('Album이 정상적으로 반환되어야한다', () async {
      // http.testing.dart에서 제공하는 MockClient를 사용
      // Response를 반환하는 함수 작성
      final client = MockClient((request) async {
        // 모킹할 내용 작성
        if (request.url.toString() ==
            'https://jsonplaceholder.typicode.com/albums/1') {
          return http.Response(
            '{"userId": 1, "id": 1, "title": "quidem molestiae enim"}',
            200,
          );
        }
        return http.Response(
          'error',
          404,
        );
      });

      // isA는 타입 검사, 테스트할 때 주로 사용
      expect(await fetchAlbum(client), isA<Album>());
    });

    // 404인 경우
    test('404 에러인 경우에는 예외를 발생시켜야한다', () async {
      final client = MockClient((request) async {
        if (request.url.toString() ==
            'https://jsonplaceholder.typicode.com/albums/1') {
          return http.Response(
            'Not Found',
            404,
          );
        }
        return http.Response(
          'error',
          404,
        );
      });
      expect(
        // 함수 자체를 써줘야지 결과를 넣는 게 아니므로 await를 쓰지 않음
        fetchAlbum(client),
        throwsException,
      );
    });
  });
}
