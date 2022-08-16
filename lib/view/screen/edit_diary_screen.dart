import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/button_widget.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';

class EditDiaryScreen extends StatefulWidget {
  const EditDiaryScreen({Key? key}) : super(key: key);

  @override
  State<EditDiaryScreen> createState() => _EditDiaryScreenState();
}

class _EditDiaryScreenState extends State<EditDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> EmojiList = [
      'images/angry_emoji.png',
      'images/blank_emoji.png',
      'images/funny_emoji.png',
      'images/happy_emoji.png',
      'images/sad_emoji.png',
    ];

    bool isVisible = false;
    bool isClicked = false;
    String _currentEmoji = 'images/angry_emoji.png';
    // String current(String value) {
    //   setState(() {
    //     _currentEmoji = value;
    //   });
    //   return
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.toNamed('/home'),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: const Color(0xFFFFFDF9),
          child: Align(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('오늘 하루 어땠나요?', style: TextStyle(fontSize: 28.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Container(
                    width: 350,
                    height: 116,
                    decoration: BoxDecoration(
                      color: const Color(0x4dC4DDFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '오늘의 감정',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            const SizedBox(width: 10.0),
                            Image.asset(
                              EmojiList[0],
                              width: 40.0,
                              height: 40.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            EmojiList.length,
                            (index) => InkWell(
                              onTap: () {
                                print('clicked');
                                print(EmojiList[index]);
                                _currentEmoji = EmojiList[index];
                              },
                              child: Image.asset(EmojiList[index],
                                  width: 40, height: 40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFieldWidget(
                    validator: (value) {},
                    fieldTitle: '',
                    hintText: '100자 이내로 작성해주세요 :)',
                    maxLine: 10,
                    maxLength: 100,
                    borderRadius: 15.0,
                  ),
                ),
                ButtonWidget(label: '저장하기', onTap: () => print('저장 버튼 클릭')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
