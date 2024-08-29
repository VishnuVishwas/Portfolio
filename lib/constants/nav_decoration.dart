// nav bar box decoration
import 'package:flutter/material.dart';

import 'colors.dart';

BoxDecoration kBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.transparent,
      CustomColors.bgLight1.withOpacity(0.3),
      CustomColors.bgLight1.withOpacity(0.6),
      CustomColors.bgLight1,
    ],
    stops: const [0.0, 0.5, 0.85, 1.0],
  ),
  borderRadius: BorderRadius.circular(100),
);
