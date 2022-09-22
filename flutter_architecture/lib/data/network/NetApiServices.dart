import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/exceptions/App_exception.dart';
import 'package:flutter_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw fetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw fetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadDataException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw fetchDataException(
            "Error Occured while communicating with server" +
                "with server code" +
                response.statusCode.toString());
    }
  }
}
