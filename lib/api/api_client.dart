import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/ad.dart';

class ApiClient {
  static const _baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, dynamic>> login(String email, String password) async {
    Uri url = Uri.parse('$_baseUrl/auth/login/');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        body: json.encode(
          {'email': email, 'password': password},
        ),
        headers: headers);
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<List<Ad>> getAds() async {
    Uri url = Uri.parse('$_baseUrl/ads/');
    final response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    final ads = (data as List).map((ad) => Ad.fromJson(ad)).toList();
    return ads;
  }
  // Future<List<Map<String, dynamic>>>> getNews() async {
  //   final response = await http.get('$baseUrl/news');
  //   return List<Map<String, dynamic>>.from(json.decode(response.body));
  // }
}
