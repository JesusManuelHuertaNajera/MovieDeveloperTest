import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mymovies/content/config/api/config.dart';

class ApiMethod {
  String baseUrl = "${ApiValues.baseUrl}/3/";
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<bool> removeContentType() async {
    headers.remove('Content-Type');
    return true;
  }

  Future<bool> addHeaderToken() async {
    String? token = ApiValues.apiKey;
    headers["Authorization"] = "Bearer ${token}";
    return true;
  }

  Future<http.Response> apiPost(
      {required Map<String, dynamic> body, required String request}) async {
    http.Response response = await http.post(Uri.parse("${baseUrl}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    debugPrint(jsonEncode(body));
    return response;
  }

  Future<http.Response> apiPostlst(
      {required List<Map<String, dynamic>> body,
      required String request}) async {
    http.Response response = await http.post(Uri.parse("${baseUrl}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    debugPrint(jsonEncode(body));
    return response;
  }

  Future<http.Response> apiPut(
      {required Map<String, dynamic> body, required String request}) async {
    http.Response response = await http.put(Uri.parse("${baseUrl}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    return response;
  }

  Future<http.Response> apiPatch(
      {required Map<String, dynamic> body, required String request}) async {
    http.Response response = await http.patch(Uri.parse("${baseUrl}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    return response;
  }

  Future<http.Response> apiGet(
      {Map<String, String>? queryParams, required String request}) async {
    final uri = Uri.parse("${baseUrl}$request").replace(
      queryParameters: queryParams,
    );

    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    return response;
  }

  Future<http.Response> apiDelete({required String request}) async {
    final uri = Uri.parse("${baseUrl}$request");

    http.Response response = await http.delete(
      uri,
      headers: headers,
    );

    return response;
  }
}
