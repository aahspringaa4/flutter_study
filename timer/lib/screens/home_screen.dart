import 'dart:async';

import 'package:flutter/material.dart';

class HoemScreen extends StatefulWidget {
  const HoemScreen({super.key});

  @override
  State<HoemScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HoemScreen> {
  static const twentyFiveMinuts = 1500;
  int totalSeconds = twentyFiveMinuts;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if(totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinuts;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
    setState(() {
      totalSeconds;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick 
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinuts;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    format(totalSeconds),
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Flexible(
                flex: 3,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed: isRunning ? onPausePressed
                          : onStartPressed,
                          icon: Icon( 
                          isRunning ? Icons.
                          pause_circle_outline : Icons.
                          play_circle_outline)),
                      IconButton(
                        iconSize: 110,
                        onPressed: onResetPressed, 
                        icon: const Icon(
                          Icons.reset_tv
                        )
                        )
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pomodors',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                            ),
                            Text(
                              '$totalPomodoros',
                                style: TextStyle(
                                    fontSize: 58,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
