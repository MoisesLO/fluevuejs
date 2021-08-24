import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var data;
List _items = [];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Vue js',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // import Json
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/vue.json');
    final datos = await json.decode(response);
    setState(() {
      _items = datos;
      data = datos;
      print(datos);
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vue Js'),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  child: Icon(Icons.anchor),
                ),
                title: Text('${_items[index]['title']}'),
              ),
            );
          }),
    );
  }
}
