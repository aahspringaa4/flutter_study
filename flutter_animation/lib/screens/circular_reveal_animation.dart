import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CircularView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CIRCULAR"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 16),
            CircularRevealAnimation(
              child: Image.asset('assets/images/panda-bear.png'),
              animation: animation,
              centerOffset: const Offset(130, 100),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 180,
          left: 30,
        ),
        child: Container(
          alignment: Alignment.topCenter,
          child: FloatingActionButton(
            onPressed: () {
              if (animationController.status == AnimationStatus.forward ||
                  animationController.status == AnimationStatus.completed) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
            backgroundColor: Colors.orange,
            child: const Text("눌러바"),
          ),
        ),
      ),
    );
  }
}
