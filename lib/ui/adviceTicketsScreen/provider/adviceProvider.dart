import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/apiEndpoints.dart';

import '../../../../ApiCalling/response.dart';

class Adviceprovider extends ChangeNotifier {
  Future<http.Response> departments() async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = apiEndpoints.departments;
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

  Future<http.Response> singleDepartment(id) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = '${apiEndpoints.departments}/$id';
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

  Future<http.Response> viewtikitdetaisl(id) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = "${apiEndpoints.ticketsviw}$id";
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

  Future<http.Response> viewtikitrepliesdetaisl(id) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = "${apiEndpoints.ticketsviw}$id/threads";
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

  Future<http.Response> addticketsapi(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.tickets;
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

  Future<String?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('my_id');
  }

  Future<http.Response> replyTicketApi(
      Map<String, dynamic> bodyData, ticketId) async {
    String url = "${apiEndpoints.tickets}/$ticketId/sendReply";
    print("API URL: $url");
    String? storedId;
    storedId = await getId();
    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json';
    headers['impersonatedUserId'] = storedId ?? '';
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

  Future<http.Response> therdDetails(therdid) async {
    String url = "${apiEndpoints.therdapi}$therdid";
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
}
