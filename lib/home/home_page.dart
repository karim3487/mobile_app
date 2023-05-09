import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/api/di/locator.dart';
import 'package:mobile_app/api/models/ad.dart';
import 'package:mobile_app/home/ad_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeStore = locator.get<HomeStore>();

  @override
  void initState() {
    getAds();
    super.initState();
  }

  Future<void> getAds() async {
    await _homeStore.getAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новости"),
      ),
      body: SafeArea(
        child: Observer(
          builder: (BuildContext context) {
            if (_homeStore.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: _homeStore.adsList.length,
              itemBuilder: (context, index) {
                final ad = _homeStore.adsList[index];
                return CardAd(ad: ad);
              },
            );
          },
        ),
      ),
    );
  }
}

class CardAd extends StatelessWidget {
  const CardAd({
    super.key,
    required this.ad,
  });
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    AdStore adStore = AdStore(ad: ad);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          adStore.fullName,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          ad.title,
          style: const TextStyle(fontSize: 15, color: Colors.black45),
        ),
        onExpansionChanged: (isExpanded) {},
        initiallyExpanded: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ad.text.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
