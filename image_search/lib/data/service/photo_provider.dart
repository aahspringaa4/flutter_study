import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/pixabayapi.dart';

import '../model/Photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'NO PIXABAYAPI');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetchValue(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
