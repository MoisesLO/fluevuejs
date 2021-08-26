import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.green),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: 'Vue js',
    home: Scaffold(
      appBar: AppBar(
        title: Text('VueJs Documentacion Esp Offline'),
      ),
      body: Home(),
    ),
  ));
}





