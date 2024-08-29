import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  // Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // get screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // body
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.1,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.centerLeft, // Aligns the Column to the left
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns the children to the left
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hi there! ',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 36,
                          color: CustomColors.whitePrimary,
                          fontWeight: FontWeight.w500),
                    ),
                    Image.asset('assets/hi_emoji.png', height: 25),
                  ],
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    text: 'I\'m ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 46,
                      color: CustomColors.whitePrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Vishnu Vishwas',
                        style: TextStyle(
                          color: Color(0xFF4FC3F7), // Light Blue for your name
                        ),
                      ),
                      TextSpan(text: ','),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: screenWidth / 2.5,
                  child: RichText(
                    maxLines: 3,
                    text: const TextSpan(
                      text: 'A passionate ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Flutter Developer',
                          style: TextStyle(
                            color: Color(
                                0xFF1E88E5), // Stronger Blue for "Flutter Developer"
                          ),
                        ),
                        TextSpan(
                          text: '. I turn innovative ideas into ',
                        ),
                        TextSpan(
                          text: 'responsive',
                          style: TextStyle(
                            color: Color(
                                0xFF42A5F5), // Accent Blue for "responsive"
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'engaging',
                          style: TextStyle(
                            color: Color(
                                0xFFA5D6A7), // Pastel Green for "engaging"
                          ),
                        ),
                        TextSpan(
                          text: ' mobile apps.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // Button row
                Row(
                  children: [
                    const SizedBox(width: 80),
                    // Let's Connect button
                    SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () => _launchURL('https://wa.me/6360859253'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.green.shade600,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: WidgetStateProperty.all(5.0),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 20.0)),
                        ),
                        child: const Text(
                          'Let\'s Connect',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // View Resume button
                    SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () => _launchURL(
                            'https://drive.google.com/file/d/1oxFJ9xnJXvCFpCt-fVcKxzGKycTgHPV1/view?usp=sharing'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.blue.shade800,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: WidgetStateProperty.all(5.0),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 20.0)),
                        ),
                        child: const Text(
                          'View Resume',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 70.0), // Left margin for icons
                  child: Row(
                    children: [
                      const SizedBox(width: 110),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.linkedin.com/in/vishnu-vishwas'),
                        child: const FaIcon(FontAwesomeIcons.linkedin),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () =>
                            _launchURL('https://github.com/VishnuVishwas'),
                        child: const FaIcon(FontAwesomeIcons.github),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.instagram.com/_vish_was_007/'),
                        child: const FaIcon(FontAwesomeIcons.instagram),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () => _launchURL('https://wa.me/6360859253'),
                        child: const FaIcon(FontAwesomeIcons.whatsapp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // pfp
          Container(
            width: screenWidth / 4,
            height: screenWidth / 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: const Offset(3, 5),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/vishnu_pfp.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
