import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/domain/model/photo.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  Future<List<Photo>> fetch(String query) async {
    final response = await client.get(Uri.parse(
        'https://pixabay.com/api/?key=21056807-cf1538472ec9d3806d8db9d9f&q&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print('jsonResponse: $jsonResponse');
    List<Map<String, dynamic>> hits =
        (jsonResponse['hits']).cast<Map<String, dynamic>>();
    print('hits: $hits');
    List<Photo> photoList = convertJsonListToPhotoList(hits);
    print('photo: $photoList');
    return photoList;
  }
}

List<Photo> convertJsonListToPhotoList(List<Map<String, dynamic>> jsonList) {
  List<Photo> photoList = [];

  for (var jsonMap in jsonList) {
    Photo photo = Photo.fromJson(jsonMap);
    photoList.add(photo);
  }

  return photoList;
}
