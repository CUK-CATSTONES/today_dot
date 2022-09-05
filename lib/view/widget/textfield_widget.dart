import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/sign_up_controller.dart';

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
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            focusNode: focusNode,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: fieldTitle!.contains('아이디') ? true : false,
            onTap: onTap,
            onChanged: onchanged,
            // keyboardType: fieldTitle!.contains('아이디')
            //     ? TextInputType.emailAddress
            //     : TextInputType.text,
            validator: validator,
            controller: controller,
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            obscureText: fieldTitle!.contains('비밀번호') ? true : false,
            decoration: InputDecoration(
              // suffixIcon: TextButton(
              //   child: Text(
              //     suffixButtonText ?? '',
              //     style: const TextStyle(
              //       color: Color(0xff6482B4),
              //       fontSize: 16.0,
              //     ),
              //   ),
              //   //중복확인하는 로직 필요
              //   onPressed: () async {
              //     await _signUpController.checkDuplicatedID();
              //     print('clicked');
              //   },
              // ),
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
                borderSide: const BorderSide(
                  color: Color(0xff92B4EC),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 5.0),
                ),
                borderSide: const BorderSide(
                  color: Color(0xff92B4EC),
                  width: 2.0,
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
        const SizedBox(height: 20),
      ],
    );
  }
}
