// widgets/nav_mobile.dart

import 'package:flutter/material.dart';
import 'package:porfolio/constants/nav_decoration.dart';
import 'package:porfolio/widgets/site_logo.dart';

class NavMobileWidget extends StatelessWidget {
  const NavMobileWidget({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      decoration: kBoxDecoration,
      child: Row(
        children: [
          //logo
          const SiteLogo(),
          // spacer
          const Spacer(),
          // menu
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
