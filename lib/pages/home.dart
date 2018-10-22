import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key:key) {
    print('new Home');
  }
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
    );
  }
}