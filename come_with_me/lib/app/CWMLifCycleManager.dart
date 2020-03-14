import 'dart:ui';
import 'package:come_with_me/redux/modal/AppState.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class CWMLifeCycleManager {
  DateTime appResumedTime;
  DateTime appPausedTime;
  final Store<AppState> store;
  GlobalKey<NavigatorState> navigator;

  CWMLifeCycleManager({@required this.store, this.navigator});

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      appPausedTime = DateTime.now();
    }

    if (appPausedTime == null) {
      return;
    }

    if (state == AppLifecycleState.resumed) {
      appResumedTime = DateTime.now();
      onAppResumed();
      appPausedTime = null;
      return;
    }
  }

  onAppResumed() async {
    //Do on App Resumed here
  }

  bool isAppPausedLessThan({int minutes, DateTime appPausedTime}) =>
      appResumedTime.isBefore(appPausedTime.add(Duration(minutes: minutes)));
}
