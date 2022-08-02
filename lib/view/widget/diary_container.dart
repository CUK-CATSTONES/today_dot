
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{
  final Function()? onTapFunction;
  final BoxShadow? boxShadow;
  final double? borderRadius;
  final Color? boxColor;
  final String? text;
  final double? fontsize;
  ContainerWidget({Key? key,
    this.boxColor,
    this.text,
    this.borderRadius,
    this.onTapFunction,
    this.boxShadow,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Center(
        child: Container(
          width : 335,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0,4),
              ),
            ],
              borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Text(text!,style: TextStyle(fontSize: fontsize),),
        ),
      ),
    );
  }
}
