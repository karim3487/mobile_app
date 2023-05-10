import '../../../../models/user.dart';
import '../../api_client.dart';
import '../../constants/endpoints.dart';

class AuthApi {
  // apiClient instance
  final DioClient _dioClient;

  // constructor
  AuthApi(this._dioClient);

  Future<User> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var data = {"email": email, "password": password};
    try {
      final res = await _dioClient.post(Endpoints.loginWithEmail, data: data);
      return User.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
