import 'dart:io';

import 'package:come_with_me/CWMRouting.dart';
import 'package:come_with_me/redux/modal/AppState.dart';
import 'package:come_with_me/theme/CWMTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'CWMLifCycleManager.dart';
import 'package:come_with_me_data/languages/LanguagesManager.dart';

class CWMApp extends StatefulWidget {
  CWMApp({
    Key key,
    @required this.store,
  });

  final Store<AppState> store;
//   static final Injector injector =
//       CWMDataManager.instance().getDataConfig().isMock()
//           ? MockInjector()
//           : Injector();

  @override
  State<StatefulWidget> createState() {
    return _CWMAppState();
  }
}

class _CWMAppState extends State<CWMApp> with WidgetsBindingObserver {
  final navigatorKey = GlobalKey<NavigatorState>();
  CWMLifeCycleManager _cwmLifecycleManager;

//   CWMAppViewModel viewModel;

  @override
  void initState() {
    // locale.init();
    // locale.onLocaleChangedCallback = () {
    //   setState(() {});
    // };
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cwmLifecycleManager =
        CWMLifeCycleManager(store: widget.store, navigator: navigatorKey);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _cwmLifecycleManager.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget app = StoreConnector<AppState, Null>(
      distinct: true,
      onInit: (store) {
        // viewModel = CWMAppViewModel.fromStore(store);
      },
      converter: (store) {
        // return CWMAppViewModel.fromStore(store);
      },
      builder: (_, viewModel) {
        // this.viewModel = viewModel;
        return buildApp();
      },
    );
    return StoreProvider(
      store: widget.store,
      child: app,
    );
  }

  buildApp() {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Come With Me',
      theme: CWMTheme().getTheme(),
      initialRoute: CWMRouting.STARTUP_SCREEN,
      routes: CWMRouting.buildRoutes(),
      supportedLocales: locale.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
    );
  }
}
