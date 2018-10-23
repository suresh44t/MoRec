import 'package:flutter/material.dart'; 
import 'package:movie_rec_app/widget/movie_list/movie_list.dart'; 

class Home extends StatefulWidget {
  Home( {Key key}):super(key:key) {
    print('new $key'); 
  }
  _HomeState createState() => _HomeState(); 
}

class _HomeState extends State < Home > with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title:new Text('首页'), 
        actions: < Widget > [
          new IconButton(
            icon:new Icon(Icons.search), 
            onPressed:() => showSearch(context:context, delegate:null), 
          ), 
          new PopupMenuButton(
            itemBuilder:(BuildContext context) {}, 
          )
        ], 
      ), 
      drawer:new Drawer(), 
      body:new MovieList(
        key:Key('movies-list'), 
      )
    ); 
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true; 
}
