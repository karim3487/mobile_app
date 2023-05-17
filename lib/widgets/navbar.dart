import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/sharedpref/constants/preferences.dart';
import '../shared/colors.dart';
import '../stores/user/user_store.dart';
import '../utils/routes.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late UserStore _userStore;

  @override
  void didChangeDependencies() {
    _userStore = Provider.of<UserStore>(context);
    // _userStore.getUser();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "${_userStore.user?.firstName} ${_userStore.user?.lastName}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            accountEmail: Text("${_userStore.user?.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.primary,
              backgroundImage: const AssetImage('assets/images/img_avatar.jpg'),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_header_bd.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text("Методические материалы"),
            onTap: () {
              Navigator.pushNamed(context, Routes.files);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Преподаватели"),
            onTap: () {
              Navigator.pushNamed(context, Routes.teachers);
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_sharp),
            title: const Text("Карта кафедры"),
            onTap: () => print('Карта'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Сообщения"),
            onTap: () => print('Сообщения'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Выход"),
            onTap: () {
              print('Выход');
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            title: "Выход",
            description: "Вы уверены, что хотите выйти?",
            cancel: "Отмена",
            cancelColor: Colors.black26,
            ok: "Выход",
            okColor: Colors.red[600],
            okFun: () {
              SharedPreferences.getInstance().then(
                (preference) {
                  preference.setBool(Preferences.isAuthenticated, false);
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                },
              );
            },
          );
        });
  }
}
