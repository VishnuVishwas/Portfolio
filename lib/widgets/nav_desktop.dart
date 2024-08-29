// widgets/nav_desktop.dart

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/nav_decoration.dart';
import 'package:porfolio/constants/nav_titles.dart';
import 'package:porfolio/widgets/site_logo.dart';

class NavDesktopWidget extends StatelessWidget {
  const NavDesktopWidget(
      {super.key, this.onLogoTap, required this.onNavMenTap});
  final VoidCallback? onLogoTap;
  final Function(int) onNavMenTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kBoxDecoration,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            //logo
            const SiteLogo(),
            // spacer
            const SizedBox(width: 20),
            // titles
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    onNavMenTap(i);
                  },
                  child: Text(
                    navTitles[i],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomColors.whitePrimary,
                        fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
