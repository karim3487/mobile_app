import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Екатерина Иванова"),
              accountEmail: const Text("i405b@voenmeh.ru"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset('assets/images/img_avatar.jpg'),),
              ),
            decoration: const BoxDecoration(
              color: AppColors.appBarColor
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text("Методические материалы"),
            onTap: () => print('Методические материалы'),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Преподаватели"),
            onTap: () => print('Преподы'),
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
            onTap: () => print('Выход'),
          ),
        ],
      ),
    );
  }
}
