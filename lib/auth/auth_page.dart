import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'auth_store.dart';

class AuthPage extends StatefulWidget {
  final AuthStore authStore;

  AuthPage({required this.authStore});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 24.0),
                Observer(
                  builder: (_) => ElevatedButton(
                    onPressed: widget.authStore.isLoading
                        ? null
                        : () async {
                            await widget.authStore.login(_emailController.text,
                                _passwordController.text);
                            if (widget.authStore.isAuthenticated) {
                              print("УРААААААААА!!!!!!");
                              // Navigator.pushReplacementNamed(context, '/news');
                            }
                          },
                    child: widget.authStore.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ),
                const SizedBox(height: 8.0),
                Observer(
                  builder: (_) => Text(
                    widget.authStore.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
