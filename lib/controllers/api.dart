import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/models/ad.dart';

import '../global.dart';

class Api {
  Future<String> loginUserWithEmail(String email, String password) async {
    Map<String, String> body = {
      'email': email,
      'password': password
    };
    String response = await netWorkCalls.post(UrlConstants.userLoginWithEmail, body);
    // return User.fromJson(jsonDecode(response));
    var token = jsonDecode(response)['token'];
    return token;
  }

  Future<List<Ad>> getAllAds() async {
      var response = await netWorkCalls.get(UrlConstants.allAds);
      var list = jsonDecode(response) as List;
      return list.map((item) => Ad.fromJson(item)).toList();
    }
}