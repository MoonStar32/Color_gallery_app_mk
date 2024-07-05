import 'package:color_gallery/ui/green.dart';
import 'package:color_gallery/ui/pink.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'ui/red.dart';

void main() {
  runApp(
    const MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  getColor() {
    if (_page <= 0) {
      return Colors.pink[100];
    } else if (_page <= 1) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: const Drawer(
        child: Center(child: Text("Page")),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60,
        items: const <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        backgroundColor: getColor(),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: <Widget>[
        const PinlScreen(),
        const GreenScreen(),
        const RedScreen(),
      ][_page],
    );
  }
}
