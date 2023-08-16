import 'package:flutter/material.dart';

class HomeCopy extends StatelessWidget {
  HomeCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              height: 100,
              color: Colors.red,
              child: const Text('빨빨강빨강빨빨강빨강빨빨강빨강빨강'),
            ),
            Container(
              height: 100,
              color: Colors.yellow,
              child: const Text('노랑노랑노랑노랑노랑'),
            ),
          ],
        ),
      ),
    );
  }
}
