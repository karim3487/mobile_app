import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, dynamic>> login(String email, String password) async {
    Uri url = Uri.parse('$baseUrl/auth/login/');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        body: json.encode(
          {'email': email, 'password': password},
        ),
        headers: headers);
    return json.decode(utf8.decode(response.bodyBytes));
  }
  // Future<List<Map<String, dynamic>>>> getNews() async {
  //   final response = await http.get('$baseUrl/news');
  //   return List<Map<String, dynamic>>.from(json.decode(response.body));
  // }
}
