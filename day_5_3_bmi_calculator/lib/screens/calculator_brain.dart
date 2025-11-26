import 'package:flutter/material.dart';

class CalculatorBrain {

  CalculatorBrain({required this.weight, required this.height}){}

  final int weight;
  final int height;

  Map<String, dynamic> calculateBMI(){
    double bmi = this.weight/(this.height * this.height/10000);
    Map<String, dynamic> bmiInfo = {
      'value': bmi.toStringAsFixed(1),
      'tier' : bmi > 25 ? 'OVERWEIGHT': bmi > 18.5 ? 'NORMAL': 'UNDERWEIGHT',
      'color' : (bmi >= 18.5 && bmi <= 25) ? Color(0xFF24D876): Colors.red.shade400,
      'remarks' : bmi > 25 ? 'Your body is overweight. You should look for weight loss measures.': bmi > 18? 'Your body weight is normal. Keep it up': 'Your body weight is less than normal. You should be bulking.'
    };
    return bmiInfo;
  }
}