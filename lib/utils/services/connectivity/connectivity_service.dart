import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService  {

  ConnectivityService() {
    initialise();
  }


  static final _connectivity = Connectivity();


  static void initialise() {
    checkNetwork();
    _connectivity.onConnectivityChanged.listen((result) {
      checkMode(result);
    });
  }

  static Future<void> checkNetwork() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    checkMode(connectivityResult);
  }

  Future<bool> isDeviceOnline() async {
    final res = await _connectivity.checkConnectivity();
    if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi ||
        res == ConnectivityResult.vpn || res == ConnectivityResult.ethernet){
      return true;
    }
    return false;
  }

  static void checkMode(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet) {
      setOnlineMode();
    } else {
      setOfflineMOde();
    }
  }

  static void setOfflineMOde() async {
    debugPrint('not connected');
    Future.delayed(const Duration(milliseconds: 3000)).then((value) async {
      final doubleCheck = await _connectivity.checkConnectivity();
      if (doubleCheck == ConnectivityResult.wifi ||
          doubleCheck == ConnectivityResult.mobile ||
          doubleCheck == ConnectivityResult.ethernet) {
        setOnlineMode();
      } else {
        ///your logic on offline mode
      }
    });
  }

  static void setOnlineMode() {
    debugPrint('connected');
    ///your logic on online mode

  }
}
