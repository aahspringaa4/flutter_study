import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/chartview.dart';
import 'package:flutter_animation/screens/myscreen.dart';
import 'package:flutter_animation/screens/circular_reveal_animation.dart';
import 'package:flutter_animation/screens/floating_button.dart';
import 'package:flutter_animation/screens/photo_view.dart';
import 'package:flutter_animation/screens/shimmer_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "AnimationTest",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotoAnimationView(),
                      fullscreenDialog: true,
                    ));
              },
              child: const Text('ZOOM IN ZOOM OUT'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShimmerView(),
                      fullscreenDialog: true,
                    ));
              },
              child: const Text('SHIMMER'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChartView(),
                      fullscreenDialog: true,
                    ));
              },
              child: const Text('CHART'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('MY SCREEN'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CircularView(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Circular'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FloatingView(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('FLOATING'),
            )
          ],
        ),
      ),
    );
  }
}
