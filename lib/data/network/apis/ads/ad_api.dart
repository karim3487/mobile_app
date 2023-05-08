import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../models/ad.dart';
import '../../api.dart';

class AdApi {
  Future<List<Ad>> getAds() async {
    try {
      final res = await http.get(
        Uri.parse(
          UrlConstants.baseUrl + UrlConstants.allAds,
        ),
      );
      final data = (jsonDecode(res.body) as List)
          .map((post) => Ad.fromJson(post))
          .toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
