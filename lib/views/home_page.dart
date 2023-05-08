import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobile_app/controllers/api.dart';
import 'package:mobile_app/models/ad.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchAds();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GradientBd.dec,
      child: Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            title: const Text('Новости'),
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
                    indicatorType: Indicator.ballClipRotatePulse,
                    colors: [Colors.red, Colors.orange],
                    strokeWidth: 2,
                  ),
                );
              }
            },
          )),
    );
  }

  Future _fetchAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('token!!!!!!!!!!!!');
    print(token);
    var ads = await api.getAllAds();
    _ads = ads;
  }
}
