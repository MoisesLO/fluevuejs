import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Detail.dart';

class CardList extends StatefulWidget {
  final String? number;
  final String? title;
  final String? contenido;
  const CardList({Key? key, this.number, this.title, this.contenido}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 22,
                child: Text('${widget.number}', style: (TextStyle(color: Colors.white)),),
              ),
            ),
            Flexible(child: Text('${widget.title}'))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(
              title: '${widget.title}',
              contenido: '${widget.contenido}'
            )));
      },
    );
  }
}
