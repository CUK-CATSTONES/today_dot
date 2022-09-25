import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? fieldTitle;
  final int? maxLine;
  final String? suffixButtonText;
  final TextEditingController? controller;
  final FormFieldValidator validator;
  final FocusNode? focusNode;
  final double? borderRadius;
  final int? maxLength;
  final ValueChanged<String>? onchanged;
  final VoidCallback? onTap;
  bool isEmailCorrected = true;

  TextFieldWidget({
    Key? key,
    this.hintText,
    this.suffixButtonText,
    this.maxLine,
    this.fieldTitle,
    this.controller,
    this.focusNode,
    this.borderRadius,
    this.maxLength,
    this.onchanged,
    this.onTap,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _signUpController = Get.put(SignUpController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle ?? '',
          style: TextStyle(
            fontSize: 16.0.sp,
            color: Colors.black,
            fontFamily: 'Gmarket',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            focusNode: focusNode,
            style: const TextStyle(
              fontFamily: 'Gmarket',
            ),
            autofocus: fieldTitle!.contains('아이디') ? true : false,
            onTap: onTap,
            onChanged: onchanged,
            validator: validator,
            controller: controller,
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            obscureText: fieldTitle!.contains('비밀번호') ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: const Color(0x4dC4DDFF),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 5.0),
                ),
                borderSide: const BorderSide(
                  color: Color(0x4dC4DDFF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 5.0),
                ),
                borderSide: BorderSide(
                  color: Color(0xff92B4EC),
                  width: 2.0.w,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 5.0),
                ),
                borderSide: BorderSide(
                  color: Color(0xff92B4EC),
                  width: 2.0.w,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: Color(0x4dC4DDFF),
                ),
              ),
              // errorStyle: const TextStyle(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
