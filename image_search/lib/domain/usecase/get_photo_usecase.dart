import 'package:image_search/data/datasource/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photoapi_repository.dart';

class GetPhotoUseCase {
  final PhotoApiRepository photoApiRepository;
  GetPhotoUseCase(this.photoApiRepository);

  Future<List<Photo>> excute(String query) async {
    final result = await photoApiRepository.fetch(query);
    return result;
  }
}
