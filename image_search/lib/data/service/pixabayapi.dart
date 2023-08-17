import 'dart:convert';

import '../model/Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '21056807-cf1538472ec9d3806d8db9d9f';

  Future<List<Photo>> fetchValue(String query) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo&pretty=true',
      ),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
