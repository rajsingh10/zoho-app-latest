import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/apiEndpoints.dart';

import '../../../../ApiCalling/response.dart';
import '../../../homeScreen/provider/homeProvider.dart';

class Signupprovider extends ChangeNotifier {
  Future<http.Response> checkEmailApi(String email) async {
    String url =
        "https://www.zohoapis.eu/subscriptions/v1/customers?email=$email";
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

  Future<http.Response> checkPhoneApi(String phone) async {
    String url =
        "https://www.zohoapis.eu/subscriptions/v1/customers?phone=$phone";
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

  Future<http.Response> signInApi(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.registerApi;
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

  Future<http.Response> createCustomerApi(Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.contract;
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

  Future<http.Response> updateContractApi(Map<String, dynamic> bodyData) async {
    String? storedId = await HomeProvider().getId();
    print("Stored ID =====>>> $storedId");
    String url = "${apiEndpoints.contract}/$storedId";
    print("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json'; // ensure proper content type
    log('API Headers: $headers');

    try {
      final response = await http
          .patch(
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

  Future<http.Response> updateCustomerApi(
      Map<String, dynamic> bodyData, id) async {
    String url = '${apiEndpoints.registerApi}/$id';
    print("API URL: $url");

    Map<String, String> headers = await apiConfig.getAuthHeader();
    headers['Content-Type'] = 'application/json'; // ensure proper content type
    log('API Headers: $headers');

    try {
      final response = await http
          .put(
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

  Future<http.Response> fetchCustomerApi(id) async {
    String url = '${apiEndpoints.registerApi}/$id';
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

  Future<http.Response> createSubscriptionApi(
      Map<String, dynamic> bodyData) async {
    String url = apiEndpoints.createSubscriptionApi;
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

  Future<http.Response> fetchCountriesApi() async {
    String url = apiEndpoints.fetchCountries;
    print(url);

    var responseJson;
    final response = await http
        .get(
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

  Future<http.Response> fetchPlansApi() async {
    String url = apiEndpoints.plansApi;
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
