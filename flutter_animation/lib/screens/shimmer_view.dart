import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.green,
          highlightColor: Colors.yellow,
          child: const Text(
            'HYUNMYEONG',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
