import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zohosystem/apiCalling/apiConfig.dart';

import '../../../../ApiCalling/response.dart';
import '../../../../apiCalling/apiEndPoints.dart';

class LoginProvider extends ChangeNotifier {
  Future<http.Response> refreshTokenApi() async {
    String url = apiEndpoints.refreshToken;
    print(url);
    var responseJson;
    final response = await http
        .post(
      Uri.parse(url),
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> senOtpApi(Map<String, String> bodyData) async {
    String url = apiEndpoints.sendOtp;

    print(url);
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Header = $headers');
    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers, body: bodyData)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> verifyOtpApi(Map<String, String> bodyData) async {
    String url = apiEndpoints.verifyOtp;
    print(url);
    Map<String, String> headers = await apiConfig.getAuthHeader();
    print('Header = $headers');
    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers, body: bodyData)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }

  Future<http.Response> contackid(email) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = "https://desk.zoho.eu/api/v1/contacts/search?email=$email";
    print(url);

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }
}
