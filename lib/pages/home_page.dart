import 'package:flutter/material.dart';
import 'package:mobile_app/domain/ad.dart';

import '../ad_card_widget.dart';
import '../navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Set<CardAdModel>> _items = List.generate(
      20,
      (index) => {
            CardAdModel(
                creator: "Item $index",
                description: "Description for item $index",
                text:
                    "Text for item $index. Nam et tellus pellentesque, finibus justo eu, laoreet metus. Nullam euismod metus sit amet nisi imperdiet pretium. Vivamus ultrices nunc euismod, egestas tortor egestas, euismod metus. Donec scelerisque sem eu est hendrerit, et blandit lectus pellentesque. Aliquam id dolor volutpat, pharetra ligula vel, consequat ante. Morbi sem dolor, fringilla at eros feugiat, iaculis accumsan diam. Integer eget urna luctus, bibendum purus id, dapibus libero. Sed condimentum cursus aliquam. ")
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Новости'),
        // leading: Icon(Icons.menu),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          final item = _items[index];
          return CardAdWidget(card: item.first);
        },
      ),
    );
  }
}
