class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:8000/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getAds = "$baseUrl/ads";

  // login endpoints
  static const String loginWithEmail = "$baseUrl/auth/login/";
}
