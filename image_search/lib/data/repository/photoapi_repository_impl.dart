import 'package:http/http.dart' as http;
import 'package:image_search/data/datasource/pixabay_api.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photoapi_repository.dart';

import '../datasource/result.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;
  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    return await api.fetch(query);
  }
}
