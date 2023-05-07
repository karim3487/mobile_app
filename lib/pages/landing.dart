import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_app/pages/login_page.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true;

    return isLoggedIn ? HomePage() : const LoginPage();
  }
}
