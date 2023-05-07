import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobile_app/controllers/api.dart';
import 'package:mobile_app/models/ad.dart';

import '../custom_widgets/ad_card_widget.dart';
import '../custom_widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = <Ad>[];
  Api api = Api();
  List<Ad>? _ads = <Ad>[];

  // late final List<Ad> _items = List<Ad>.generate(
  //     20,
  //     (index) => Ad(
  //         creator: User(),
  //         title: "Description for item $index",
  //         text:
  //             "Text for item $index. Nam et tellus pellentesque, finibus justo eu, laoreet metus. Nullam euismod metus sit amet nisi imperdiet pretium. Vivamus ultrices nunc euismod, egestas tortor egestas, euismod metus. Donec scelerisque sem eu est hendrerit, et blandit lectus pellentesque. Aliquam id dolor volutpat, pharetra ligula vel, consequat ante. Morbi sem dolor, fringilla at eros feugiat, iaculis accumsan diam. Integer eget urna luctus, bibendum purus id, dapibus libero. Sed condimentum cursus aliquam. ")
  // );

  @override
  void initState() {
    super.initState();
    _fetchAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Новости'),
          // leading: Icon(Icons.menu),
        ),
        body: FutureBuilder(
          future: _fetchAds(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: _ads?.length,
                  itemBuilder: (context, index) {
                    return CardAdWidget(card: _ads![index]);
                  });
            } else {
              return const Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [Colors.white],
                  strokeWidth: 2,
                  backgroundColor: Colors.black,
                  pathBackgroundColor: Colors.black,
                ),
              );
            }
          },
        ));
  }

  Future _fetchAds() async {
    var ads = await api.getAllAds();
    _ads = ads;
    if (kDebugMode) {
      Ad test = ads[0];
      print(test.text);
    }
  }
}
