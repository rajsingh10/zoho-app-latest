import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zohosystem/ui/authentications/login/modal/userDataModal.dart';

class SaveDataLocal {
  static SharedPreferences? prefs;
  static String userData = 'UserData';

  static saveLogInData(UserDataModal userdata) async {
    prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(userdata.toJson());
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
      UserDataModal user = UserDataModal.fromJson(userMap);
      return user;
    } else {
      return null;
    }
  }

  static clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    log('Data Cleared');
    prefs?.clear();
  }
}
