import 'dart:convert';
import 'package:flutter/material.dart';
import 'Detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/json/vue.json"),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final _items = json.decode(snapshot.data);
          // print(_items.length);
          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 22,
                            child: Text('${index + 1}'),
                          ),
                        ),
                      ),
                      Flexible(child: Text('${_items[index]['title']}'))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Detail(
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
