import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/apiEndpoints.dart';

import '../../../../ApiCalling/response.dart';

class billProvider extends ChangeNotifier {
  Future<http.Response> invoiceapi() async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = apiEndpoints.viewinvoiceapi;
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

  Future<http.Response> pdfviewapi(String invoicefile) async {
    Map<String, String> headers = await apiConfig.getAuthHeader();
    log('Api Header Data = $headers');
    print("header pass====>>>$headers");
    String url = "${apiEndpoints.singleInvoiceApi}$invoicefile";
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
