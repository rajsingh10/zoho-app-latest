import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/apiEndpoints.dart';

import '../../../../ApiCalling/response.dart';

class HomeProvider extends ChangeNotifier {
  Future<http.Response> subscriptionsViewApi() async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url =
        "${apiEndpoints.subscriptionsCustomeridApi}${userData?.data?[0].customerId}";
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

  Future<String?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('my_id');
  }

  Future<http.Response> Viewalltikit() async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    String? storedId = await getId();
    print("Stored ID =====>>> $storedId");
    print("header pass====>>>$headers");
    String url = "https://desk.zoho.eu/api/v1/contacts/$storedId/tickets";
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

  Future<http.Response> planDetailsApi(plancode) async {
    String url = "${apiEndpoints.planDetailsApi}$plancode";
    print(url);
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
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

  Future<http.Response> getTimeEntryApi(id) async {
    String url = "${apiEndpoints.tickets}/$id/timeEntry";
    print("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json'; // ensure proper content type
    log('API Headers: $headers');

    try {
      final response = await http
          .get(
        Uri.parse(url),
        headers: headers,
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

  Future<http.Response> updatePaymentMethod(
      Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.updatePaymentMethod;
    log("API URL: $url");

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

  Future<http.Response> getCard(id) async {
    String url = "${apiEndpoints.registerApi}/$id/cards";
    print("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json'; // ensure proper content type
    log('API Headers: $headers');

    try {
      final response = await http
          .get(
        Uri.parse(url),
        headers: headers,
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

  Future<http.Response> fetchNotification(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.fetchNotify;
    log("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('API Headers: $headers');

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: bodyData,
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

  Future<http.Response> marketingOpt(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.marketingOptIn;
    log("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('API Headers: $headers');

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: bodyData,
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

  Future<http.Response> fetchMarketingOpt(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.fetchMarketingOptIn;
    log("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('API Headers: $headers');

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: bodyData,
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
}
