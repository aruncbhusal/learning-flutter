// Since our constants are spread out across other files, it is better to consolidate them all into a single file
// That way we can access the constants from whichever files by simply importing this file
// By convention, constants begin with k so we need to refactor each of our constants to reflect that change as well

import 'package:flutter/material.dart';

const double kBottomContainerHeight = 80.0;
const Color kBottomContainerColor = Color(0xFFEB1555);
const Color kActiveCardColor = Color(0xFF101427);
const Color kInactiveCardColor = Color(0xFF1D1F33);

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const TextStyle kDisplayTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kLargeButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
);

const TextStyle kResultTitleStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const TextStyle kResultTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kResultNumStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.w900,
);