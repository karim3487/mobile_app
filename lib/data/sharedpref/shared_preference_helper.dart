import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.authToken);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isAuthenticated async {
    return _sharedPreference.getBool(Preferences.isAuthenticated) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.isAuthenticated, value);
  }

  // Timetable:-----------------------------------------------------------------
  Future<String> get groupCode async {
    return _sharedPreference.getString(Preferences.groupCode) ?? '';
  }

  Future<bool> saveGroupCode(String code) async {
    return _sharedPreference.setString(Preferences.groupCode, code);
  }

  // User:----------------------------------------------------------------------
  Future<bool> saveEmail(String email) async {
    return _sharedPreference.setString(Preferences.email, email);
  }

  Future<bool> saveFirstName(String firstName) async {
    return _sharedPreference.setString(Preferences.firstName, firstName);
  }

  Future<bool> saveLastName(String lastName) async {
    return _sharedPreference.setString(Preferences.lastName, lastName);
  }

  Future<bool> saveSurname(String? surname) async {
    if (surname != null) {
      return _sharedPreference.setString(Preferences.surname, surname);
    }
    return _sharedPreference.setString(Preferences.surname, "");
  }

  Future<bool> saveProfession(String profession) async {
    return _sharedPreference.setString(Preferences.profession, profession);
  }

  Future<String?> getEmail() async {
    return _sharedPreference.getString(Preferences.email);
  }

  Future<String?> getFirstName() async {
    return _sharedPreference.getString(Preferences.firstName);
  }

  Future<String?> getLastName() async {
    return _sharedPreference.getString(Preferences.lastName);
  }

  Future<String?> getSurname() async {
    return _sharedPreference.getString(Preferences.surname);
  }

  Future<String?> getProfession() async {
    return _sharedPreference.getString(Preferences.profession);
  }

  Future<bool> logout() async {
    return _sharedPreference.clear();
  }
}
