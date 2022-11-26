import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final String title;
  final Color commonColor;
  final Color txtColor;
  final VoidCallback onPress;
  const CalculatorButtons({Key? key,
    required this.title,
    this.commonColor = const Color(0xff808080),
    this.txtColor = const Color(0xff000000),
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: commonColor,
                shape: BoxShape.circle,
            ),
            child: Center(child: Text(title, style: TextStyle(color: txtColor, fontSize: 25,fontWeight: FontWeight.bold
            ),)),
          ),
        ),
      ),
    );
  }
}


