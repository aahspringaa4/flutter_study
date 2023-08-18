import 'package:flutter/material.dart';
import 'package:image_search/domain/usecase/get_photo_usecase.dart';

import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotoUseCase useCase;
  HomeViewModel(this.useCase);

  List<Photo> photos = [];

  Future<List<Photo>> fetch(String query) async {
    final result = await useCase.excute(query);
    print("$result My name is Yoo");
    notifyListeners();
    return result;
  }
}
