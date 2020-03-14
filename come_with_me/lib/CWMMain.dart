
import 'package:flutter/material.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import 'app/CWMApp.dart';
import 'redux/store.dart';

class CWMMain {
  static void run() async {
    const REMOTE_HOST = '192.168.1.97:9001';
    const ENABLE_DEVTOOLS = false;

    var remoteDevtools = RemoteDevToolsMiddleware(REMOTE_HOST);
    if (ENABLE_DEVTOOLS) await remoteDevtools.connect();

    final store = createStore(remoteDevtools);
    remoteDevtools.store = store;
    runApp(CWMApp(store: store));
  }
}
