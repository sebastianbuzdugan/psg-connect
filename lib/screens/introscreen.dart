import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animations/animations.dart';
import 'package:psgfanboy/screens/homepage.dart';
import 'package:psgfanboy/util/mainWidget.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});


  Future<void> _loadLottieAnimation() async {
    await Future.delayed(Duration(seconds: 3)); // Replace with actual loading logic
  }

  @override
 Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadLottieAnimation(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: SpinKitFadingCube(
            color: Colors.black87,
            size: 50.0,
          )));
        } else if (snapshot.error != null) {
          return Scaffold(body: Center(child: Text('Error loading page'))); // Show error message if something went wrong
        } else {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: SafeArea(
              child: Column(
                children: [
                  // big logo
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 120,
                      bottom: 20,
                    ),
                    child: Lottie.network('https://lottie.host/8609f3be-504f-415b-9cec-7a198e623959/irYyHKz2ul.json'),
                  ),

                       

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Welcome to PSG Connect!',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            // groceree gives you fresh vegetables and fruits
            Text(
              'Everything you need to know \n about your favorite team',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // get started button
          GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainWidget()),
    );
  },
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 16, 42, 143),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Spacer(),

            Image.asset('assets/psglogo.png', height: 50,width: 50,),

            const Spacer(),
          ],
        ),
      ),
          );
      
          }  }
    );
  }
}