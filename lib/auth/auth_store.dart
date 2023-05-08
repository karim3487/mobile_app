// lib/
//   main.dart
//   api/
//     api_client.dart
//   auth/
//     auth_store.dart
//     auth_page.dart
//   news/
//     news_store.dart
//     news_page.dart

import 'package:mobx/mobx.dart';
import '../api/api_client.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final ApiClient apiClient;

  _AuthStore(this.apiClient);

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
      final result = await apiClient.login(email, password);
      isAuthenticated = result.containsKey('token') == true;
      if (!isAuthenticated) {
        errorMessage = 'Неверный логин или пароль';
      }
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
