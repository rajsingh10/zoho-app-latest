import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/apiEndpoints.dart';

import '../../../../ApiCalling/response.dart';

class ManageMembershipProvider extends ChangeNotifier {
  Future<http.Response> subscriptionsCancelApi(subcatiptionid) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = ${headers}');
    print("header pass====>>>${headers}");
    String url = "${apiEndpoints.subscriptionsApi}${subcatiptionid}/cancel";
    print(url);

    var responseJson;
    final response = await http
        .post(
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

  Future<http.Response> updateSubscriptionApi(
      Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.updateSubscription;
    print("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json'; // ensure proper content type
    log('API Headers: $headers');

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(bodyData),
      )
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw const SocketException('Request timed out');
        },
      );

      log('Response Status: ${response.statusCode}');

      return response; // 🔁 returning full response directly
    } catch (error) {
      log("Error During Communication: $error");
      rethrow; // 👈 rethrow for catchError() to handle
    }
  }

  Future<http.Response> subscriptionsPauseApi(
      Map<String, dynamic> bodyData, subcatiptionid) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = ${headers}');
    print("header pass====>>>${headers}");
    String url = "${apiEndpoints.subscriptionsApi}${subcatiptionid}/pause";
    print(url);

    var responseJson;
    final response = await http
        .post(
      Uri.parse(url),
      body: jsonEncode(bodyData),
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

  Future<http.Response> subscriptionsResumeApi(
      Map<String, dynamic> bodyData, subcatiptionid) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = ${headers}');
    print("header pass====>>>${headers}");
    String url = "${apiEndpoints.subscriptionsApi}${subcatiptionid}/resume";
    print(url);

    var responseJson;
    final response = await http
        .post(
      Uri.parse(url),
      body: jsonEncode(bodyData),
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
