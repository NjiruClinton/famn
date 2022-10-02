import 'package:famn/screens/profilepage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Khang',
      ),
      home: HomePage(),
    );
  }
}