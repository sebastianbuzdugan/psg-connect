import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final String imageName;
  final String lastWin;
  final String manager;
  final double borderRadius = 12;

  const DonutTile({
    Key? key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.imageName,
    required this.lastWin,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'x $donutPrice',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            // donut picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Image.asset(imageName),
            ),
            // donut flavor
            Text(
              donutFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              lastWin,
              style: TextStyle(color: Colors.grey[600]),
            ),
            // manager icon + name
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
      
                  // manager icon
                  Icon(
                    Icons.person,
                    color: Colors.grey[800],
                  ),
                  // manager name
                  const SizedBox(height: 4),
                  Text(
                    manager,
                    style: TextStyle(color: Colors.grey[800], fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
