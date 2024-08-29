import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Skills heading
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Skills',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Platform section
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.bgLight2,
            ),
            child: Column(
              children: [
                const Text(
                  'Platforms I work On',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: platform.map((platformItem) {
                    return ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(platformItem['icon'], color: Colors.white),
                      label: Text(
                        platformItem['title'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Tools and Frameworks section
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.bgLight2,
            ),
            child: Column(
              children: [
                const Text(
                  'Tools and Frameworks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: skills.map((skillItem) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: CustomColors.bgLight1,
                      child: Container(
                        width: 80, // Adjusted for mobile
                        height: 80, // Adjusted for mobile
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                skillItem['image'],
                                width: 30, // Adjusted for mobile
                                height: 30, // Adjusted for mobile
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              skillItem['title'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Roboto'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Add space after the last container
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
