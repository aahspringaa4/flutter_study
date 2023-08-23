import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoAnimationView extends StatefulWidget {
  const PhotoAnimationView({super.key});

  @override
  State<PhotoAnimationView> createState() => _PhotoAnimationViewState();
}

class _PhotoAnimationViewState extends State<PhotoAnimationView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhotoView(
        imageProvider: Image.asset('assets/images/panda-bear.png').image,
      ),
    );
  }
}
