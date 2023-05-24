class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:8000/api";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 30000);

  // ads endpoints
  static const String getAds = "$baseUrl/ads";

  // teachers endpoints
  static const String getTeachers = "$baseUrl/teachers";

  // teachers endpoints
  static const String getFiles = "$baseUrl/attachments";

  // login endpoints
  static const String loginWithEmail = "$baseUrl/auth/login/";

  // timetable endpoints
  static const String getGroupTimeTable = "$baseUrl/timetables/";
  static const String getGroups = "$baseUrl/groups/";
}
