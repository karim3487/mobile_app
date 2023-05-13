import 'dart:async';

import 'api/apis/ads/ad_api.dart';
import 'api/apis/auth/auth_api.dart';
import '../../data/sharedpref/shared_preference_helper.dart';
import '../../models/user.dart';
import '../models/ad_list.dart';

class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // api object
  final AuthApi _authApi;
  final AdApi _adApi;

  // constructor
  Repository(this._sharedPrefsHelper, this._authApi, this._adApi);

  // Ad: ---------------------------------------------------------------------
  Future<AdList> getAds() async {
    return await _adApi.getAds().then((adsList) {
      return adsList;
    }).catchError((error) => throw error);
  }

  // Login:---------------------------------------------------------------------
  Future<User> login(String email, String password) async {
    return await _authApi.login(email, password);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isAuthenticated => _sharedPrefsHelper.isAuthenticated;

  // User:----------------------------------------------------------------------
  Future<void> saveUser(User user) async {
    _sharedPrefsHelper.saveEmail(user.email!);
    _sharedPrefsHelper.saveFirstName(user.firstName!);
    _sharedPrefsHelper.saveLastName(user.lastName!);
    _sharedPrefsHelper.saveSurname(user.surname);
    _sharedPrefsHelper.saveProfession(user.profession!);
    _sharedPrefsHelper.saveAuthToken(user.token!);
  }

  Future<User> getUser() async {
    return User(
      email: await _sharedPrefsHelper.getEmail(),
      firstName: await _sharedPrefsHelper.getFirstName(),
      lastName: await _sharedPrefsHelper.getLastName(),
      surname: await _sharedPrefsHelper.getSurname(),
      profession: await _sharedPrefsHelper.getProfession(),
      token: await _sharedPrefsHelper.getAuthToken(),
    );
  }
}
