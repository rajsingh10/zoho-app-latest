import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    return false;
  }

  // Try to lookup a known address to confirm actual internet access
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }

  return false;
}
