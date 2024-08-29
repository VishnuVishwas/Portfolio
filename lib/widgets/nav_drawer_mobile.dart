// nav_drawer_mobile.dart

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/nav_titles.dart';

class NavDrawerMobileWidget extends StatelessWidget {
  const NavDrawerMobileWidget({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.scaffoldBg,
      child: ListView(
        children: [
          // close icon
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context, ());
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),

          // all menu icons
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: const TextStyle(
                  color: CustomColors.whitePrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i]),
            )
        ],
      ),
    );
  }
}
