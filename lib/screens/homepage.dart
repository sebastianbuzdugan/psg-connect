import 'package:flutter/material.dart';
import 'package:psgfanboy/tabs/trophies.dart';

import 'openCard.dart';
import '../tabs/legends.dart';
import '../tabs/players.dart';
import '../util/glass_box.dart';
import '../util/players.dart';
import '../util/my_appbar.dart';
import '../util/my_bottombar.dart';
import '../util/my_tabbar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // tab options
  List tabOption = [
    ["Players", PlayersCards()],
    ["Legends", Legends()],
    ["Trophies", Trophies()],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        extendBody: true,
        body: ListView(
          children: [
            MyAppBar(
              title: 'Explore the team',
            ),

            // tab bar
            SizedBox(
              height: 900,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
