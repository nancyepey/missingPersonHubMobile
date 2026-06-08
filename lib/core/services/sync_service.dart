
import 'package:connectivity_plus/connectivity_plus.dart';

class SyncService {
  void init() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        // trigger sync
      }
    });
  }
}
