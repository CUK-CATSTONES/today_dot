import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? bgColor; // button 색상
  final String label; // button text
  final Function() onTap;
  const ButtonWidget({
    Key? key,
    this.bgColor,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 42,
        decoration: BoxDecoration(
            color: bgColor ?? const Color(0xb392B4EC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.0,
              color: bgColor ?? const Color(0xb392B4EC),
            )),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }
}
