import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FloatingView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
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
        title: Text("FLOATING"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                child: const Text("판다 나와라!"),
                onPressed: () => showRevealDialog(context),
                color: Colors.orange,
              ),
              SizedBox(height: 16),
              CircularRevealAnimation(
                child: Image.asset('assets/images/panda-bear.png'),
                animation: animation,
                centerOffset: Offset(130, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showRevealDialog(BuildContext context) async {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // 인자값 순서
            margin:
                const EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/panda-bear.png'),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return CircularRevealAnimation(
          child: child,
          animation: anim1,
          centerAlignment: Alignment.bottomCenter,
        );
      },
    );
  }
}
