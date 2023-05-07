import 'dart:convert';
import 'dart:io';

import '../global.dart';
import 'package:http/http.dart';

class NetworkCalls {
  Future<String> get(String url) async {
    Uri uri = Uri.parse(url);
    var response = await client.get(uri);
    checkAndThrowError(response);
    return utf8.decode(response.bodyBytes);
  }

  Future<String> post(String url, Map<String, String> body) async {
    Uri uri = Uri.parse(url);
    var headers = {'Content-Type': 'application/json'};
    var response = await client.post(uri, body: jsonEncode(body), headers: headers);
    checkAndThrowError(response);
    return utf8.decode(response.bodyBytes);
  }

  static void checkAndThrowError(Response response) {
    if(response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
