import 'package:flutter/widgets.dart';

import 'connection.dart';

class DatabaseAdmConnection with WidgetsBindingObserver {
  // Retorna o estado atual do app
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var connection = Connection();
    print(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        connection.closeConnection();
        break;
      case AppLifecycleState.paused:
        connection.closeConnection();
        break;
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
