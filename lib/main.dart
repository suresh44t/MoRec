import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/discovery.dart';
import 'pages/mine.dart';

void main() => runApp(new MoRecApp());

/// Returns the color scheme used by MovieRecApp
MaterialColor moRecColor() {
  return new MaterialColor(0xFF0498C1, {
    50: new Color(0xFFE1F3F8),
    100: new Color(0xFFB4E0EC),
    200: new Color(0xFF82CCE0),
    300: new Color(0xFF4FB7D4),
    400: new Color(0xFF2AA7CA),
    500: new Color(0xFF0498C1),
    600: new Color(0xFF0390BB),
    700: new Color(0xFF0385B3),
    800: new Color(0xFF027BAB),
    900: new Color(0xFF016A9E)
  });
}

class MoRecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MovieRec',
      theme: new ThemeData(
        primarySwatch: moRecColor(),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: moRecColor(),
        backgroundColor: Colors.white
      ),
      home: new MainPage(),
      showPerformanceOverlay: false,
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController pageController;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new PageView(
        children: <Widget>[
          new Home(key: new Key('Home')),
          new Discovery(key: new Key('Discovery')),
          new Mine(key: new Key('Min'))
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home), 
            title: new Text('首页')
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.explore), 
            title: new Text('发现')
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle), 
            title: new Text('首页')
          ),
        ],
        onTap: onTap,
        currentIndex: page,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

  // 初始化状态
  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  // 点击底部导航栏
  void onTap(int index) {
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  // 页面改变
  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}

