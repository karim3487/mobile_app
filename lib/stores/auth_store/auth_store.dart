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

  @observable
  bool isAuthenticated = false;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    try {
      final result = await _repository.login(email, password);
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  void logout() {
    isAuthenticated = false;
  }
}
