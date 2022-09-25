import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: 300.w,
        height: 42.h,
        decoration: BoxDecoration(
            color: bgColor ?? const Color(0xb392B4EC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.0.w,
              color: bgColor ?? const Color(0xb392B4EC),
            )),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 17.0.sp,
                fontFamily: 'nexon',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
