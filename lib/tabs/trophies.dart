import 'package:flutter/material.dart';
import '../util/donut_tile.dart';
import '../util/neu_box.dart';

class Trophies extends StatelessWidget {
  // list of donuts
  List donutsOnSale = [
    // [ donutFlavor, donutPrice, imageName, lastWin, manager ]
    ["Champions Trophy", "11", "assets/trophies/trophee.png", "Last Win: 2022", "Mauricio Pochettino"],
    ["French League Cup", "9", "assets/trophies/leaguecup.png", "Last Win: 2020", "Thomas Tuchel"],
    ["French Cup", "14", "assets/trophies/frenchcup.png", "Last Win: 2021", "Mauricio Pochettino"],
    ["Ligue 1", "11", "assets/trophies/frenchlcup.png", "Last Win: 2023", "Christophe Galtier"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return NeuBox(
          margin: EdgeInsets.all(10), 
          child: DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            imageName: donutsOnSale[index][2],
            lastWin: donutsOnSale[index][3],
            manager: donutsOnSale[index][4],
          )
        );
      },
    );
  }
}
