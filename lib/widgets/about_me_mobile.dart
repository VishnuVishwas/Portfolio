import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Actual content
    return Container(
      // margin: EdgeInsets.only(bottom: 30),
      color: CustomColors.bgLight1,
      child: Column(
        children: [
          // About me heading
          Container(
            margin: const EdgeInsets.only(top: 18.0),
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // About me content
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: CustomColors.bgLight2,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'I’m Vishnu Vishwas, a B.Tech student in Computer Science at Srinivas University Institute of Engineering & Technology, Mangalore. I’m passionate about coding and particularly enjoy working with Flutter. Solving problems through technology excites me, and I’m eager to collaborate with other developers and continue learning and growing in the dynamic field of web and app development.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
