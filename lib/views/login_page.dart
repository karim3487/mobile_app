import 'package:flutter/material.dart';
import 'package:mobile_app/views/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Api api = Api();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _logo(),
          _form("ВОЙТИ", _loginUser),
        ],
      ),
    );
  }

  Widget _logo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            "БГТУ \"ВОЕНМЕХ\" ИМ Д. Ф. УСТИНОВА",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _input(Icon icon, String hint, TextEditingController controller,
      bool isPassword) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white54),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: const IconThemeData(color: Colors.white),
                child: icon,
              ),
            )),
      ),
    );
  }

  Widget _button(String label, void Function() func) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(255, 128, 56, 1)),
          overlayColor:
              MaterialStatePropertyAll(Theme.of(context).primaryColor),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white, width: 3)),
          ),
        ),
        onPressed: () {
          func();
        },
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }

  Widget _form(String label, void Function() func) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 35),
            child: _input(
                const Icon(Icons.person), "ЛОГИН", _emailController, false)),
        Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 25),
            // padding: const EdgeInsets.only(bottom: 0, top: 0),
            child: _input(
                const Icon(Icons.lock), "ПАРОЛЬ", _passwordController, true)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: _button(label, func),
          ),
        )
      ],
    );
  }

  Future _loginUser() async {
    _email = _emailController.text;
    _password = _passwordController.text;
    try {
      var token = await api.loginUserWithEmail(_email, _password);
      final SharedPreferences? prefs = await _prefs;
      await prefs?.setString("token", token);
      Get.off(() => const HomePage());

      _emailController.clear();
      _passwordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Неправильный логин или пароль'),
        ),
      );
    }
  }
}
