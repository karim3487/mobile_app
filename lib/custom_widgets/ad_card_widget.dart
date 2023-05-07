import 'package:flutter/material.dart';
import 'package:mobile_app/models/ad.dart';

class CardAdWidget extends StatefulWidget {
  final CardAdModel card;

  const CardAdWidget({Key? key, required this.card}) : super(key: key);

  @override
  State<CardAdWidget> createState() => _CardAdWidgetState();
}

class _CardAdWidgetState extends State<CardAdWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          widget.card.creator.toUpperCase(),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          widget.card.description,
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
              widget.card.text,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
