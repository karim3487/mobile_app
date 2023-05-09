import 'package:mobx/mobx.dart';
import '../api/api_client.dart';
import '../api/di/locator.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final ApiClient _apiClient = locator<ApiClient>();

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
      final result = await _apiClient.login(email, password);
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
