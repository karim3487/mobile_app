import 'package:flutter/cupertino.dart';
import 'package:mobile_app/api/di/locator.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _postStore = locator.get<HomeStore>();

  @override
  void initState() {
    getAds();
    super.initState();
  }

  Future<void> getAds() async {
    await _postStore.getAds();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Home Page")),
    );
  }
}
