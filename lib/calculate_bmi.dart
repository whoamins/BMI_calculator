import 'package:bmi_calculator/utils/interpretation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Calculate {

  Calculate({@required this.height, @required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;

  final _random = new Random();

  double _bmi; // _ = Private

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getInterpretation() {

    if (_bmi > 25) {
      return highBMI[_random.nextInt(highBMI.length)];
    }
    else if (_bmi > 18.5) {
      return normalBMI[_random.nextInt(normalBMI.length)];
    }
    else if (_bmi >= 16) {
      return lowBMI[_random.nextInt(lowBMI.length)];
    }
    else {
      return 'You are hopeless, run to gain weight!';
    }

  }
}