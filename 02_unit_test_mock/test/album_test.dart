import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:unit_test_mock/album.dart';

import 'album_test.mocks.dart';

// 리스트 안에 모킹할 객체를 써줌
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('Album이 정상적으로 반환되어야한다', () async {
      // 가짜 클라이언트를 만들 것임(Mockito로)
      final client = MockClient();
      // when에는 내가 동작시킬 메서드의 결과를 가상으로 만들 수 있음
      // client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')); 이 부분
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer(
        (_) async => http.Response(
          // 위 요청을 보냈을 때 정상일 때의 값
          '{"userId": 1, "id": 1, "title": "quidem molestiae enim"}',
          200,
        ),
      );
      // isA는 타입 검사, 테스트할 때 주로 사용
      expect(await fetchAlbum(client), isA<Album>());
    });
  });
}
