import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network/network_calls.dart';

final client = Client();

final netWorkCalls = NetworkCalls();

final mySharedPreferences = MySharedPreferences();

final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
final Function mathFunc = (Match match) => '${match[1]},';

abstract class UrlConstants {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String userLoginWithEmail = '$baseUrl/auth/login/';
  static const String allAds = '$baseUrl/ads/';
}

abstract class SharedPreferencesKeys {
  static const String isDarkTheme = 'isDarkTheme';
  static const String homeCountryDetails = 'homeCountry';
}

class MySharedPreferences {
  Future<List<String>?> fetchHomeCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = prefs.getStringList(SharedPreferencesKeys.homeCountryDetails);
    if (list != null) {
      return list;
    }
    return null;
  }
}