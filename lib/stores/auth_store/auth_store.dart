import 'package:mobile_app/models/user.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../utils/dio/dio_error_util.dart';
import '../error_store/error_store.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _AuthStore(Repository repository) : _repository = repository {
    // checking if user is logged in
    repository.isAuthenticated.then((value) {
      isAuthenticated = value;
    });
  }

// store variables:-----------------------------------------------------------
  static ObservableFuture<User?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<User?> loginFuture =
      ObservableFuture<User?>(emptyPostResponse);
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

    final future = _repository.login(email, password);
    loginFuture = ObservableFuture(future);
    future.then((user) async {
      _repository.saveIsLoggedIn(true);
      this.isAuthenticated = true;
      this.success = true;
    }).catchError((error) {
      errorStore.errorMessage = "Неверный логин или пароль";
      this.isAuthenticated = false;
      this.success = false;
    });
    isLoading = false;
  }

  @action
  void logout() {
    isAuthenticated = false;
    _repository.saveIsLoggedIn(false);
  }
}
