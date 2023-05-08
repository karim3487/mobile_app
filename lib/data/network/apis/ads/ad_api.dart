import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../models/ad.dart';
import '../../api.dart';

class AdApi {
  Future<List<Ad>> getAds() async {
    try {
      var res = await http.get(
        Uri.parse(
          UrlConstants.allAds,
        ),
      );
      var resUtf8 = utf8.decode(res.bodyBytes);
      final data = (jsonDecode(resUtf8) as List)
          .map((post) => Ad.fromJson(post))
          .toList();
      return data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
