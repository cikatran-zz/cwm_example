import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import 'modal/AppState.dart';
import 'reducer/app_reducer.dart';

Store<AppState> createStore(RemoteDevToolsMiddleware remoteDevtools) {
  final store = DevToolsStore<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [
        remoteDevtools,
      ]);
  return store;
}
