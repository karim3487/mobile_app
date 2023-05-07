import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/ad.dart';

class CardAdWidget extends StatefulWidget {
  final Ad card;

  const CardAdWidget({Key? key, required this.card}) : super(key: key);

  @override
  State<CardAdWidget> createState() => _CardAdWidgetState();
}

class _CardAdWidgetState extends State<CardAdWidget> {
  bool _isExpanded = false;
  late Ad _card;
  late String _creator;

  @override
  void initState() {
    super.initState();
    _card = widget.card;
    _creator = _card.creator!.profession!;
    if (kDebugMode) {
      print("In card");
      print(_card.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          _creator,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          _card.title.toString(),
          style: const TextStyle(fontSize: 15, color: Colors.black45),

        ),
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        initiallyExpanded: _isExpanded,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _card.text.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
