import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  Discovery({Key key}) : super(key:key) {
    print('new Discovery');
  }
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('发现'),
      ),
    );
  }
}