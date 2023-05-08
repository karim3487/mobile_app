import 'package:flutter/material.dart';
import 'package:mobile_app/stores/ad_store.dart';

import '../di/locator.dart';

class AdsList extends StatefulWidget {
  const AdsList({super.key});

  @override
  State<AdsList> createState() => _AdsListState();
}

class _AdsListState extends State<AdsList> {
  final _adStore = getIt.get<AdStore>();

  @override
  void initState() {
    getAds();
    super.initState();
  }

  Future<void> getAds() async {
    await _adStore.getAds();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          getAds();
        },
        child: Text("Test"),
      )),
    );
    ;
  }
}
