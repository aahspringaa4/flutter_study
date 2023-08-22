import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as timezone;

import '../service/notification_service.dart';

void helloEvent() async {
  await cancelNotification();
  await requestPermissions();
  showNotification();
}

void oneMinuteLaterEvent() async {
  await cancelNotification();
  await requestPermissions();
  final timezone.TZDateTime now = timezone.TZDateTime.now(timezone.local);
  await registerMessage(
    hour: now.hour,
    minutes: now.minute + 1,
    message: '휴.. 1분 기다리느랴 힘들었다.',
  );
}

void timePicker(context) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  pickTimeLaterEvent(selectedTime);
}

List<String> list = [];
StreamController<List<String>> streamBox = StreamController<List<String>>();

void pickTimeLaterEvent(TimeOfDay? time) async {
  await cancelNotification();
  await requestPermissions();
  addNoti('${time!.hour}시 ${time.minute}분 알림');
  await registerMessage(
    hour: time.hour,
    minutes: time.minute,
    message: '${time.hour}시 ${time.minute}분 알림 전송 완료',
  );
}

Future<void> addNoti(String item) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  list.add(item);
  streamBox.add(list);
  prefs.setStringList('noti', list);
}

void clearNoti() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  streamBox.add([]);
  list.clear();
  prefs.clear();
  cancelScheduledNotification();
}
