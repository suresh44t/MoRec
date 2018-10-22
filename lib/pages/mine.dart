import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key:key) {
    print('new Mine');
  }
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
    );
  }
}