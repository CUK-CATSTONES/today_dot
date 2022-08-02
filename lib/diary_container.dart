
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{
  final Function()? onTapFunction;
  final BoxShadow? boxShadow;
  final double? borderRadius;
  final Color? boxColor;
  final Text? text;
  ContainerWidget({Key? key,
    this.boxColor,
    this.text,
    this.borderRadius,
    this.onTapFunction,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Center(
        child: Container(
          width : 335,
          height: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius!),
          ),
          // BorderRadius: const BorderRadius.all(Radius.circular(25.0)),

        ),
      ),
    );
  }
}
