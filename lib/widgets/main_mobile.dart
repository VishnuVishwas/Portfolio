import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 120),
        constraints: BoxConstraints(minHeight: screenHeight / 1.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile picture
            Container(
              width: screenWidth / 1.5,
              height: screenWidth / 1.5,
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

            const SizedBox(height: 50),

            // Introduction text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hi there! ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: CustomColors.whitePrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('assets/hi_emoji.png', height: 25),
              ],
            ),

            const SizedBox(height: 7),

            const Text(
              'I\'m Vishnu Vishwas,',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),

            // Highlighted text
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'A ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'passionate ',
                    style: TextStyle(
                      color: CustomColors.whitePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Flutter Developer.',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: ' I turn innovative ideas into '),
                  TextSpan(
                    text: 'responsive ',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'engaging ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'mobile apps.'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Button row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Let's Connect button
                SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: ElevatedButton(
                    onPressed: () => _launchURL('https://wa.me/6360859253'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                      elevation: 5.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    child: const Text(
                      'Let\'s Connect',
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.w500),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      elevation: 5.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    child: const Text(
                      'View Resume',
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () =>
                      _launchURL('https://www.linkedin.com/in/vishnu-vishwas'),
                  child: const FaIcon(FontAwesomeIcons.linkedin),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => _launchURL('https://github.com/VishnuVishwas'),
                  child: const FaIcon(FontAwesomeIcons.github),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () =>
                      _launchURL('https://www.instagram.com/_vish_was_007/'),
                  child: const FaIcon(FontAwesomeIcons.instagram),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => _launchURL('https://wa.me/6360859253'),
                  child: const FaIcon(FontAwesomeIcons.whatsapp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
