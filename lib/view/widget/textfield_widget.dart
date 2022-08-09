import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/sign_up_controller.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? fieldTitle;
  final int? maxLine;
  final String? suffixButtonText;
  final TextEditingController? textEditingController;
  final FormFieldValidator validator;
  final FocusNode? focusNode;
  bool isEmailCorrected = true;
  TextFieldWidget({
    Key? key,
    this.hintText,
    this.suffixButtonText,
    this.maxLine,
    this.fieldTitle,
    this.textEditingController,
    this.focusNode,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: fieldTitle!.contains('아이디') ? true : false,
            keyboardType: fieldTitle!.contains('아이디')
                ? TextInputType.emailAddress
                : TextInputType.text,
            validator: validator,
            controller: textEditingController,
            maxLines: maxLine ?? 1,
            obscureText: fieldTitle!.contains('비밀번호') ? true : false,
            decoration: InputDecoration(
              suffixIcon: TextButton(
                child: Text(
                  suffixButtonText ?? '',
                  style: const TextStyle(
                    color: Color(0xff6482B4),
                    fontSize: 16.0,
                  ),
                ),
                //중복확인하는 로직 필요
                onPressed: () {
                  // print('중복확인하는 중,,');
                  // if (textEditingController != '') {
                  //   _signUpController.checkID();
                  // } else {
                  //   print('dd');
                  // }
                },
              ),
              hintText: hintText,
              filled: true,
              fillColor: const Color(0x4dC4DDFF),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: Color(0x4dC4DDFF),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                  color: Color(0xff92B4EC),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
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
              errorStyle: const TextStyle(color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
