import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final Color? textColor;
  final String text;
  final Function() onTapFunction;
  TextButtons({Key? key,
    this.textColor,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Center(
        child:Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
