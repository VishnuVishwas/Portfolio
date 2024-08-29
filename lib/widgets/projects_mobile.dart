// projects_mobile.dart

import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/project_items.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({super.key});

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
              fontFamily: 'Roboto',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: projectItems.map((project) {
              return Card(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                color: CustomColors.bgLight1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            project['title'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),

                          // Techstack
                          Text(
                            project['techstack'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 10),
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

                          const SizedBox(height: 10),

                          // Code link
                          if (project['code'] != null)
                            TextButton(
                              onPressed: () {
                                // Open the URL
                                launch(project['code']);
                              },
                              child: const Text(
                                'View Code',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
