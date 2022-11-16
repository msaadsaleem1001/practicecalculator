import 'package:calculator/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorHome());
}

class CalculatorHome extends StatelessWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
