import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              child: Image.asset('lib/images/logo.png'),
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "БГТУ \"ВОЕНМЕХ\" ИМ Д. Ф. УСТИНОВА",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(255, 128, 56, 1)),
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

    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (kDebugMode) {
        print(_email);
        print(_password);
      }
      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          decoration: const BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              colors: [
                Color.fromRGBO(255, 138, 0, 1),
                Color.fromRGBO(255, 222, 47, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              _logo(),
              _form("ВОЙТИ", _loginUser),
            ],
          ),
        ));
  }
}
