// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/testing.dart';
// import 'package:image_search/data/repository/photoapi_repository_impl.dart';
// import 'package:mockito/annotations.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';

// @GenerateMocks([http.Client])
// void main() {
//   test('Pixabay', () async {
//     final api = PixabayApi();
//     final client = MockClient((request) async {
//       return http.Response('good', 200);
//     });

//     when(client.get(Uri.parse(
//             '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo')))
//         .thenAnswer((_) async => http.Response("임시 값이 들어갈 부분입니다ㅁㅁㅁㅁ", 200));

//     final result = await api.fetch('iphone');
//     expect(result.length, 20);

//     verify(client.get(Uri.parse(
//         '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo')));
//   });
// }
