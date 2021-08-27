import 'dart:convert';
import 'package:flutter/material.dart';
import 'Detail.dart';
import 'CardItem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

var _items;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/json/vue.json"),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _items = json.decode(snapshot.data);
          // print(_items.length);
          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                child: CardList(
                  title: _items[index]['title'],
                  number: '${index + 1}',
                  contenido: _items[index]['contenido'],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(
                                title: '${_items[index]['title']}',
                                contenido: '${_items[index]['contenido']}',
                              )));
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
