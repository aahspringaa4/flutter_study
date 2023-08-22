import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/notification_service.dart';
import '../viewmodel/notification_viewmodel.dart';

class NotiHomePage extends StatefulWidget {
  const NotiHomePage({super.key});

  @override
  State<NotiHomePage> createState() => NotificationScreen();
}

class NotificationScreen extends State<NotiHomePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    loadNoti();
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> loadNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loadNoti = prefs.getStringList('noti') ?? [];
    setState(() {
      for (int i = 0; i < loadNoti.length; i++) {
        addNoti(loadNoti[i]);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FlutterAppBadger.removeBadge();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Notification Test Yeah!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 42,
            ),
            OutlinedButton(
              onPressed: () => helloEvent(),
              child: const Text("Hello~!"),
            ),
            const SizedBox(
              width: 12,
            ),
            OutlinedButton(
              onPressed: () => oneMinuteLaterEvent(),
              child: const Text("One Minute Later 알림"),
            ),
            const SizedBox(
              width: 12,
            ),
            OutlinedButton(
              onPressed: () => timePicker(context),
              child: const Text("시간 지정 알림"),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: StreamBuilder<List<String>>(
                stream: streamBox.stream,
                builder: (context, snapshot) {
                  if (snapshot.data!.isEmpty || !snapshot.hasData) {
                    return const Center(
                      child: Text("알림을 추가해보세요!"),
                    );
                  }
                  final items = snapshot.data!;
                  return Stack(
                    children: [
                      ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index]),
                          );
                        },
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3, right: 3),
                          child: MaterialButton(
                            onPressed: () {
                              clearNoti();
                            },
                            child: const Text("CLEAR"),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
