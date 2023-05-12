import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/stores/auth_store/auth_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../shared/colors.dart';
import '../../utils/routes.dart';
import '../../widgets/empty_app_bar.dart';
import '../../widgets/progress_indicator_widget.dart';
import '../../widgets/textfield_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //text controllers:-----------------------------------------------------------
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  late AuthStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<AuthStore>(context);
  }

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Container(
        decoration: const BoxDecoration(gradient: GradientBd.gradient),
        child: Stack(
          children: <Widget>[
            Center(child: _buildRightSide()),
            Observer(
              builder: (context) {
                return _store.isAuthenticated
                    ? navigate(context)
                    : _showErrorMessage("");
              },
            ),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _store.isLoading,
                  child: const CustomProgressIndicatorWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 24.0),
            const Text(
              'БГТУ "Военмех" им Д.Ф. Устинова',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50.0),
            _buildUserIdField(),
            _buildPasswordField(),
            _buildSignInButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          padding: const EdgeInsets.only(left: 8, right: 8),
          hint: "Email",
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.white,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setEmail(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: "Пароль",
          isObscure: true,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
          icon: Icons.lock,
          iconColor: Colors.white,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          onChanged: (value) {
            _store.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.orange[700]),
            overlayColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor),
            elevation: MaterialStateProperty.all(2),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.white, width: 3)),
            ),
          ),
          child: const Text(
            "Войти",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onPressed: () async {
            if (_store.canLogin) {
              // DeviceUtils.hideKeyboard(context);
              _passwordFocusNode.unfocus();
              _store.login();
              _showErrorMessage("Неверный логин или пароль");
            } else {
              _showErrorMessage("Пожалуйста, заполните все поля");
            }
          },
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.isAuthenticated, true);
    });

    Future.delayed(const Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: "Ошибка",
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      });
    }

    return const SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
