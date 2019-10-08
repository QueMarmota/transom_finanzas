import 'dart:io';
import 'package:demo/screens/Home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //function to override back button android function
  @override
  void dispose() {
    super.dispose();
  }

  _navigateToIndex() async {
    //give a sec while flutter render the current view(the current view its a black container)
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
  }

  @override
  void initState() {
    super.initState();
    //Navigate to Home
    _navigateToIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
