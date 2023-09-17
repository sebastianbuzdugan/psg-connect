import 'package:flutter/material.dart';
import 'package:psgfanboy/screens/homepage.dart';
import 'package:psgfanboy/util/my_bottombar.dart';

import '../screens/aboutpsg.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  // Define your pages here
  final List<Widget> _pages = [HomePage(), AboutPSG()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: MyBottomBar(
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
