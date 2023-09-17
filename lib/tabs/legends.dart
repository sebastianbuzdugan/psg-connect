import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:psgfanboy/tabs/playersCard.dart'; // import movies.dart here

class Legends extends StatefulWidget {
  const Legends({Key? key}) : super(key: key);

  @override
  _LegendsState createState() => _LegendsState();
}

class _LegendsState extends State<Legends> {
  CarouselController _carouselController = new CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            children: [
              Image.asset(players[_current]['image'],
                  fit: BoxFit.cover), // use the imported movies variable here
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.grey.shade300.withOpacity(1),
                        Colors.grey.shade300.withOpacity(1),
                        Colors.grey.shade300.withOpacity(1),
                        Colors.grey.shade300.withOpacity(1),
                        Colors.grey.shade300.withOpacity(0.0),
                        Colors.grey.shade300.withOpacity(0.0),
                        Colors.grey.shade300.withOpacity(0.0),
                        Colors.grey.shade300.withOpacity(0.0),
                      ])),
                ),
              ),
              Positioned(
                bottom: 50,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 500.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  carouselController: _carouselController,
                  items: players.map((movie) {
                    // use the imported movies variable here
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(movie['image'],
                                      fit: BoxFit
                                          .cover), // use movie['image'] here
                                ),
                                SizedBox(height: 20),
                                Text(movie['title'],
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Text(movie['position'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black45),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(height: 20),
                                AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: _current == players.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                 
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // matches
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.military_tech_rounded,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text('${movie['matches']}',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.black87)),
                                          ],
                                        ),
                                        // goals
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.sports_soccer_rounded,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text('${movie['goals']}',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.black87)),
                                          ],
                                        ),
                                        // assists
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.sensor_occupied_sharp,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text('${movie['assists']}',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // second
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                    ' Last Year Played: ${movie['lastYearPlayed']}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey.shade600)),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
