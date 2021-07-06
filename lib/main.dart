import 'package:flutter/material.dart';
import 'package:fluttercalculator_app/SimpleCalculator.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.amber),
      home: SimpleCalculator(),
    );
  }
}


