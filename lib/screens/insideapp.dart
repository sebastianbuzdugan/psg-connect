

import 'package:flutter/material.dart';

import '../util/my_bottombar.dart';
import 'aboutpsg.dart';
import 'homepage.dart';

class InsideAppPage extends StatefulWidget {
  const InsideAppPage({Key? key}) : super(key: key);

  @override
  State<InsideAppPage> createState() => _InsideAppPageState();
}

class _InsideAppPageState extends State<InsideAppPage> {
  int _currentIndex = 0;

  final _pages = [
    HomePage(),
    AboutPSG(),
    // Add more pages here...
  ];

void _onTabTapped(int? index) {
  if (index != null) {
    setState(() {
      _currentIndex = index;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: MyBottomBar(
        index: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
