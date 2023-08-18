import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/datasource/result.dart';
import 'package:image_search/domain/model/photo.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '21056807-cf1538472ec9d3806d8db9d9f';
  Future<List<Photo>> fetch(String query) async {
    final response = await client.get(Uri.parse(
        'https://pixabay.com/api/?key=21056807-cf1538472ec9d3806d8db9d9f&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<Map<String, dynamic>> hits =
        (jsonResponse['hits'] as List).cast<Map<String, dynamic>>();
    List<Photo> photos = [];
    for (int i = 0; i < hits.length; i++) {
      Photo photo = photoFromJson(hits[i]);
      photo.tags ??= 'ddd';
      photo.previewUrl ??= 'ddd';
      photos.add(photo);
    }
    return photos;
  }
}
