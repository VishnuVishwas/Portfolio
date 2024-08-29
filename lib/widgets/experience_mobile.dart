import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/experience_items.dart';

class ExperienceMobile extends StatelessWidget {
  const ExperienceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.bgLight1,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experienceItems.map((experience) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 15),
                color: CustomColors.bgLight2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Image.asset(
                        experience['image'],
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 15),
                      // Title
                      Text(
                        experience['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Position
                      Text(
                        experience['position'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),

                      // Duration
                      Text(
                        experience['duration'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 15),
                      // Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: experience['description'].map<Widget>((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              '• $item',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
