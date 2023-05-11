import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // repository instance
  final Repository _repository;

  // constructor:---------------------------------------------------------------
  _AuthStore(Repository repository) : _repository = repository {
    // checking if user is logged in
    repository.isAuthenticated.then((value) {
      isAuthenticated = value;
    });
  }

// store variables:-----------------------------------------------------------
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isAuthenticated = false;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  bool success = false;

  @computed
  bool get canLogin => email.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login() async {
    isLoading = true;
    try {
      final result = await _repository.login(email, password);
      isAuthenticated = true;
      success = true;
      print(result);
    } catch (e) {
      success = false;
      debugPrint(e.toString());
      errorMessage = "asd";
    } finally {
      isLoading = false;
    }
  }

  @action
  void logout() {
    isAuthenticated = false;
  }
}
