import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String? hintText;
  String? fieldTitle;
  int? maxLine;
  String? suffixButtonText;
  TextFieldWidget(
      {Key? key,
        this.hintText,
        this.suffixButtonText,
        this.maxLine,
        this.fieldTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle ?? '',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            maxLines: maxLine ?? 1,
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
                  print('dd');
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
                  color: Color(0x4dC4DDFF),
                ),
              ),
            ),
          ),
        ),],
    );
  }
}