import 'package:flutter/material.dart';
import 'package:robbinlaw/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0B1034),
        scaffoldBackgroundColor: Colors.blueGrey[800],
      ),
      home: Home(),
    );
  }
}
