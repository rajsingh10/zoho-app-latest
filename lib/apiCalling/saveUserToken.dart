import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zohosystem/ui/authentications/login/modal/authTokenModal.dart';

class SaveAuthtokenData {
  static SharedPreferences? prefs;
  static String userData = 'AuthData';

  static saveAuthData(AuthtokenModal authdata) async {
    prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(authdata.toJson());
    await prefs?.setString(userData, json);
    print('dataStoared');
  }

  static getDataFromLocal() async {
    prefs = await SharedPreferences.getInstance();
    String? userString = prefs?.getString(userData);
    if (userString != null) {
      Map<String, dynamic> userMap = jsonDecode(
        userString,
      ); // Specify the type here
      AuthtokenModal user = AuthtokenModal.fromJson(userMap);
      return user;
    } else {
      return null;
    }
  }

  static Future<void> removeAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userData);
  }

  static clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    log('Data Cleared');
    prefs?.clear();
  }
}
