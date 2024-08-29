import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    // Actual content
    return Container(
      color: CustomColors.bgLight1, // Primary background color
      child: Column(
        children: [
          // About me heading
          Container(
            margin: const EdgeInsets.only(top: 22.0),
            padding: const EdgeInsets.all(18),
            child: const Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ),

          // About me content
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(160, 20, 160, 50),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(
                      0xff424657), // Lighter grey for content background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40, 40, 40),
                  child: Text(
                    'I’m Vishnu Vishwas, a B.Tech student in Computer Science at Srinivas University Institute of Engineering & Technology, Mangalore. I’m passionate about coding and particularly enjoy working with Flutter. Solving problems through technology excites me, and I’m eager to collaborate with other developers and continue learning and growing in the dynamic field of web and app development.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
