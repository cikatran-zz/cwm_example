import 'package:come_with_me/feature/home/Home.dart';

class CWMRouting {
  static const STARTUP_SCREEN = "/";

  static buildRoutes() {
    return {
      STARTUP_SCREEN: (context) => Home(),
    };
  }
}
