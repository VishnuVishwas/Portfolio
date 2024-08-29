// projects_desktop.dart

import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/project_items.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsDesktop extends StatefulWidget {
  const ProjectsDesktop({super.key});

  @override
  State<ProjectsDesktop> createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop> {
  final Map<int, bool> _isHovered = {}; // Track hover state

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.scaffoldBg,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: projectItems.asMap().entries.map((entry) {
              int index = entry.key;
              var project = entry.value;

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
                  margin: const EdgeInsets.fromLTRB(200, 30, 200, 20),
                  color: _isHovered[index] == true
                      ? CustomColors.bgLight2 // Highlighted color
                      : CustomColors.bgLight1, // Default color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: _isHovered[index] == true
                      ? 10
                      : 5, // Elevation change on hover
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          project['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              project['title'],
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Roboto'),
                            ),

                            // Techstack
                            Text(
                              project['techstack'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 15),
                            // Description
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  project['description'].map<Widget>((item) {
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

                            const SizedBox(height: 15),

                            // Code link
                            if (project['code'] != null)
                              TextButton(
                                onPressed: () {
                                  // Open the URL
                                  launch(project['code']);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors
                                      .green.shade600, // Button text color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10), // Button padding
                                ),
                                child: const Text(
                                  'View Code',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
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
