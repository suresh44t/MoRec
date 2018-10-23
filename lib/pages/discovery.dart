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
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => showSearch(
              context: context, delegate: null),
          ),
          new PopupMenuButton(itemBuilder: (BuildContext context) {},)
        ],
      ),
      drawer: new Drawer(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.create,
          color: Colors.white,
        ), onPressed: () {},

      ),
    );
  }
}