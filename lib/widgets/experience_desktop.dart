import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/experience_items.dart';

class ExperienceDesktop extends StatefulWidget {
  const ExperienceDesktop({super.key});

  @override
  _ExperienceDesktopState createState() => _ExperienceDesktopState();
}

class _ExperienceDesktopState extends State<ExperienceDesktop> {
  final Map<int, bool> _isHovered = {}; // Track hover state

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.bgLight1,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Experience',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experienceItems.asMap().entries.map((entry) {
              int index = entry.key;
              var experience = entry.value;

              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered[index] = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered[index] = false;
                  });
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(60, 30, 60, 20),
                  color: _isHovered[index] == true
                      ? CustomColors.scaffoldBg // Highlighted color
                      : CustomColors.bgLight2, // Default color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: _isHovered[index] == true
                      ? 10
                      : 5, // Elevation change on hover
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Image.asset(
                          experience['image'],
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                experience['title'],
                                style: const TextStyle(
                                  fontSize: 27,
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
                                children: experience['description']
                                    .map<Widget>((item) {
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
                      ],
                    ),
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
