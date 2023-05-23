import 'dart:async';
import 'dart:io';

import 'package:mobile_app/data/api/apis/timetable/timetable_api.dart';
import 'package:mobile_app/models/file_list.dart';
import 'package:mobile_app/models/teacher_list.dart';
import 'package:mobile_app/models/timetable_list.dart';

import 'api/apis/ads/ad_api.dart';
import 'api/apis/auth/auth_api.dart';
import '../../data/sharedpref/shared_preference_helper.dart';
import '../../models/user.dart';
import '../models/ad_list.dart';
import 'api/apis/file/file_api.dart';
import 'api/apis/teachers/teacher_api.dart';

class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // api object
  final AuthApi _authApi;
  final AdApi _adApi;
  final TeacherApi _teacherApi;
  final FileApi _fileApi;
  final TimetableApi _timetableApi;

  // constructor
  Repository(this._sharedPrefsHelper, this._authApi, this._adApi,
      this._teacherApi, this._fileApi, this._timetableApi);

  // Ad: ---------------------------------------------------------------------
  Future<AdList> getAds() async {
    return await _adApi.getAds().then((adsList) {
      return adsList;
    }).catchError((error) => throw error);
  }

  // Teacher: ----------------------------------------------------------------
  Future<TeacherList> getTeachers() async {
    return await _teacherApi.getTeachers().then((teacherList) {
      return teacherList;
    }).catchError((error) => throw error);
  }

  // Teacher: ----------------------------------------------------------------
  Future<FileList> getFiles() async {
    return await _fileApi.getFiles().then((fileList) {
      return fileList;
    }).catchError((error) => throw error);
  }

  Future<File> downloadFile(String url, String savePath) async {
    return await _fileApi.downloadFile(url, savePath).then((fileList) {
      return fileList;
    }).catchError((error) => throw error);
  }

  // Timetable: ---------------------------------------------------------------------
  Future<TimetableList> getTimetable(String groupCode) async {
    return await _timetableApi.getTimetable(groupCode).then((timetableList) {
      return timetableList;
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
      token: await _sharedPrefsHelper.authToken,
    );
  }

  // General:-------------------------------------------------------------------
  Future<void> logout() async {
    _sharedPrefsHelper.logout();
  }
}
