import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psgfanboy/screens/openCard.dart';

import '../util/FadeAnimation.dart';
import '../util/players.dart';
import '../util/neu_box.dart';

class PlayersCards extends StatefulWidget {
  const PlayersCards({Key? key}) : super(key: key);

  @override
  _PlayersCardsState createState() => _PlayersCardsState();
}

class _PlayersCardsState extends State<PlayersCards> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> jobList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/players.json');
    final data = await json.decode(response);
    setState(() {
      jobList = data['players'].map((data) => Players.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false, //
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 20,
    
          title: Container(
            height: 45,
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) {
                setState(() {}); // This will trigger a rebuild of your widget
              },
              style: TextStyle(fontSize: 14),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  hintText: "Search e.g Mbappe",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: jobList.length + 1,
          itemBuilder: (context, index) {
            if (index == jobList.length) {
              return SizedBox(height: 200);
            } else if (_searchController.text.isEmpty ||
                jobList[index]
                    .name
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase())) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height *
                              0.8, // Constrain the height here
                          child: OpenCard(job: jobList[index]),
                        ),
                      );
                    },
                  );
                },
                child: NeuBox(
                  margin: EdgeInsets.only(bottom: 20),
                  child: jobComponent(job: jobList[index]),
                ),
              );
            } else {
              return Container(); // Return an empty container for non-matching players
            }
          },
        ),
      ),
    );
  }

  jobComponent({required Players job}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(job.profilePic),
                      )),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(job.joined,
                              style: TextStyle(color: Colors.grey[500])),
                        ]),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    job.isMyFav = !job.isMyFav;
                  });
                },
                child: AnimatedContainer(
                    height: 35,
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: job.isMyFav
                              ? Colors.red.shade100
                              : Colors.grey.shade300,
                        )),
                    child: Center(
                        child: job.isMyFav
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.grey.shade600,
                              ))),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Text(
                        job.position,
                        style: TextStyle(
                          color: job.positionColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: job.positionColor,
                      ),
                      child: Text(
                        job.nationality,
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    )
                  ],
                ),
                Text(
                  job.fifa24,
                  style: TextStyle(
                    color: int.parse(job.fifa24.substring(0, 2)) > 85
                        ? Colors.red
                        : int.parse(job.fifa24.substring(0, 2)) > 80
                            ? Colors.orange
                            : Colors.green,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
