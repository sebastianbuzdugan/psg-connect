import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // import GoogleFonts here
import 'package:psgfanboy/util/neu_box.dart';
import '../util/my_bottombar.dart';

class AboutPSG extends StatefulWidget {
  const AboutPSG({Key? key}) : super(key: key);

  @override
  _AboutPSGState createState() => _AboutPSGState();
}

List<Widget> _buildFunFacts() {
  List<String> facts = [
    'Founded in 1970 by a couple of Parisian business people.',
    'Known as Les Rouge et Bleu and Les Parisiens.',
    'Most successful club in football history in France with over 30 titles.',
    'Home stadium is Parc des Princes since 1974.',
    'Biggest rival is Olympique de Marseille.',
    'Owned by Qatar Sports Investments.'
  ];

  return facts.map((fact) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('•', style: GoogleFonts.oswald(fontSize: 18, color: Colors.grey[800])),
        SizedBox(width: 10),
        Expanded(child: Text(fact, style: GoogleFonts.oswald(fontSize: 18, color: Colors.grey[800]))),
      ],
    ),
  )).toList();
}
class _AboutPSGState extends State<AboutPSG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            // use a column widget here
            children: [
              // image at the top
              Image.asset('assets/psg_stadium.jpeg',
                  fit: BoxFit.cover), // use an asset image here
              // title
              Text('About PSG FC',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 52)), // use GoogleFonts here
              // subtitle
              Text('The history and achievements of the Parisian club',
                  style: GoogleFonts.bebasNeue(fontSize: 18, color: Colors.grey)),
              // fun facts
              // fun facts
                               SizedBox(height: 20), // Add some space
         
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._buildFunFacts(), // Function to build the list of fun facts
            ],
          ),
        ),
                    // Manager's information
                    SizedBox(height: 20), // Add some space
                    NeuBox(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                  'assets/president.jpeg'), // Replace with the manager's image path
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nasser Al-Khelaifi',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Text(
                                'Chairman and CEO of PSG',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text('Since 2011',
                                  style: TextStyle(color: Colors.grey[500])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
            ),
          
      
      
    );
  }
}
