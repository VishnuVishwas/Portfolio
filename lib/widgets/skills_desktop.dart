import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  _SkillsDesktopState createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  // Tracks the hover state of each icon
  final Map<int, bool> _isHovered = {};

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      child: Column(
        children: [
          // Skills heading
          Padding(
            padding: const EdgeInsets.only(top: 42.0),
            child: const Text(
              'Skills',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Platform and Skills
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Platform
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.bgLight2,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Platforms I work On',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Platform items
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 350),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: platform.asMap().entries.map((entry) {
                                int index = entry.key;
                                var platformItem = entry.value;
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
                                  child: Transform.scale(
                                    scale:
                                        _isHovered[index] == true ? 1.1 : 1.0,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(platformItem['icon'],
                                          color: Colors.white),
                                      label: Text(
                                        platformItem['title'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      width: 50), // Space between platform and skills

                  // Skills
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.bgLight2,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Tools and Frameworks',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Skills items in cards
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 650),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: skills.asMap().entries.map((entry) {
                                int index = entry.key;
                                var skillItem = entry.value;
                                return MouseRegion(
                                  onEnter: (_) {
                                    setState(() {
                                      _isHovered[index + platform.length] =
                                          true;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      _isHovered[index + platform.length] =
                                          false;
                                    });
                                  },
                                  child: Transform.scale(
                                    scale:
                                        _isHovered[index + platform.length] ==
                                                true
                                            ? 1.1
                                            : 1.0,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      color: CustomColors.bgLight1,
                                      child: Container(
                                        width: 100, // Set fixed width
                                        height: 100, // Set fixed height
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipOval(
                                              child: Image.asset(
                                                skillItem['image'],
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ClipRect(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  skillItem['title'],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        10, // Adjusted font size
                                                    fontFamily: 'Roboto',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
