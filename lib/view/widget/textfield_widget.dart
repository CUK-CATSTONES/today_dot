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
        ),
        fieldTitle == '아이디'
            ? Column(children: const [
                Text(
                  '중복된 아이디입니다.',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xff0047FF),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),
              ])
            : const SizedBox(height: 20),
      ],
    );
  }
}
