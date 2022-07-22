import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color? textColor;
  final Color buttonColor;
  final String text;
  final Function() onTapFunction;
  IconData? icon;
  AppButtons({Key? key,
    this.textColor,
    required this.buttonColor,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        width : 300,
        height: 42,
        child: Center(
          child:Text(
            text,
            style: TextStyle(
                color: textColor
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width : 1.0,
              color: buttonColor,
            )
        ),
      ),
    );
  }
}
