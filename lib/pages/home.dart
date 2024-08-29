import 'package:flutter/material.dart';
import 'package:porfolio/constants/size.dart';
import 'package:porfolio/widgets/about_me_desktop.dart';
import 'package:porfolio/widgets/about_me_mobile.dart';
import 'package:porfolio/widgets/contact_desktop.dart';
import 'package:porfolio/widgets/contact_mobile.dart';
import 'package:porfolio/widgets/experience_desktop.dart';
import 'package:porfolio/widgets/experience_mobile.dart';
import 'package:porfolio/widgets/main_desktop.dart';
import 'package:porfolio/widgets/main_mobile.dart';
import 'package:porfolio/widgets/nav_desktop.dart';
import 'package:porfolio/widgets/nav_drawer_mobile.dart';
import 'package:porfolio/widgets/nav_mobile.dart';
import 'package:porfolio/widgets/projects_desktop.dart';
import 'package:porfolio/widgets/projects_mobile.dart';
import 'package:porfolio/widgets/skills_desktop.dart';
import 'package:porfolio/widgets/skills_mobile.dart';

import '../constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(6, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: CustomColors.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : NavDrawerMobileWidget(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        key: scaffoldKey,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Navigation
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    NavDesktopWidget(
                      onNavMenTap: (int navIndex) {
                        scrollToSection(navIndex);
                      },
                    )
                  else
                    NavMobileWidget(
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      onLogoTap: () {},
                    ),

                  // Main Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    MainDesktop(key: navbarKeys[0])
                  else
                    MainMobile(key: navbarKeys[0]),

                  // About Me Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    AboutMeDesktop(key: navbarKeys[1])
                  else
                    AboutMeMobile(key: navbarKeys[1]),

                  // Skills Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    SkillsDesktop(key: navbarKeys[2])
                  else
                    SkillsMobile(key: navbarKeys[2]),

                  // Experience Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    ExperienceDesktop(key: navbarKeys[3])
                  else
                    ExperienceMobile(key: navbarKeys[3]),

                  // Projects Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    ProjectsDesktop(key: navbarKeys[4])
                  else
                    ProjectsMobile(key: navbarKeys[4]),

                  // Contact Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    ContactDesktop(key: navbarKeys[5])
                  else
                    ContactMobile(key: navbarKeys[5]),
                ],
              ),
            ),
            // Scroll to Top Button
            if (scrollController.hasClients && scrollController.offset > 300)
              Positioned(
                bottom: 30,
                right: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    scrollToTop();
                  },
                  child: Icon(Icons.arrow_upward),
                  backgroundColor: Colors.blue,
                ),
              ),
          ],
        ),
      );
    });
  }

  // Function to scroll to the desired section
  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Function to scroll to the top of the screen
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
