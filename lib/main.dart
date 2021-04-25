import 'dart:async';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

StreamController<bool> isLightTheme = StreamController();

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kThemePrimaryColor,
          scaffoldBackgroundColor: kThemeScaffoldBackgroundColor),
      home: InputPage(),
    );
  }
}
