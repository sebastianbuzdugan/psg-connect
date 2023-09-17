// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../util/players.dart';
import '../util/neu_box.dart';

class OpenCard extends StatefulWidget {
  final Players job;
  const OpenCard({Key? key, required this.job}) : super(key: key);

  @override
  State<OpenCard> createState() => _OpenCardState();
}

class _OpenCardState extends State<OpenCard> {
  late int currentIndex;
  List<dynamic> jobList = [];

// @override
// void initState() {
//   super.initState();
//   currentIndex = jobList.indexOf(widget.job);
//   print('Job List Length: ${jobList.length}'); // Add this line
// }

  @override
  Widget build(BuildContext context) {
    int rating = int.parse(widget.job.fifa24.substring(0, 2));

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // back button and menu button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      height: 60,
                      width: 60,
                    ),
                    Text('P L A Y E R   P R O F I L E'),
                    SizedBox(
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),

                // cover art, artist name, song name
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(widget.job.profilePic),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.job.position}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${widget.job.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.sports_soccer_rounded,
                              color: Colors.blue[900],
                              size: 32,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // start time, shuffle button, repeat button, end time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.query_stats_rounded),
                    Text('${widget.job.cm}'), // Use job title here
                    Text('${widget.job.kg}'), // Use job address here
                    Text('${widget.job.age}'), // Use ßjob address here
                  ],
                ),

                const SizedBox(height: 30),

                NeuBox(
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    percent: rating / 99, // Convert the rating to a percentage
                    progressColor: rating > 85
                        ? Colors.red
                        : rating > 80
                            ? Colors.orange
                            : Colors.green,
                    backgroundColor: Colors.transparent,
                    center: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,
                            color: Colors.black,
                            size: 14), // Adjust the size here
                        SizedBox(
                            width:
                                5), // Add some space between the icon and the text
                        Text("$rating/99",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14)), // Adjust the size here
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: NeuBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: NeuBox(
                            child: Icon(
                              Icons.close_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NeuBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
