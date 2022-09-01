import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/button_widget.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:today_dot/view_model/edit_diary_controller.dart';

class EditDiaryScreen extends StatefulWidget {
  const EditDiaryScreen({Key? key}) : super(key: key);

  @override
  State<EditDiaryScreen> createState() => _EditDiaryScreenState();
}

class _EditDiaryScreenState extends State<EditDiaryScreen> {
  List<String> emojiList = [
    'images/happy.png',
    'images/hmm.png',
    'images/yummy.png',
    'images/wink.png',
    'images/dizzy.png',
    'images/angry.png',
    'images/smile.png',
    'images/sad.png',
  ];
  bool isVisible = false;
  bool isClicked = false;
  String currentEmoji = 'images/happy.png';
  String defaultEmoji = 'images/default.png';
  late int pickEmojiIndex;

  TextEditingController content = TextEditingController();
  EditDiaryController editcontroller = EditDiaryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode textFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
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
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('오늘 하루 어땠나요?', style: TextStyle(fontSize: 28.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: InkWell(
                    onTap: () => Get.bottomSheet(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            emojiList.length,
                            (index) => InkWell(
                              onTap: () {
                                print(emojiList[index]);
                                print('index: $index');
                                setState(() {
                                  isClicked = true;
                                  pickEmojiIndex = index;
                                  currentEmoji = emojiList[index];
                                  editcontroller.emoji = currentEmoji;
                                });
                                print('currentEmoji: $currentEmoji');
                                print(
                                    'editcontroller.emoji: ${editcontroller.emoji}');
                                print('pickEmojiIndex: $pickEmojiIndex');
                                print('isClicked: $isClicked');
                                print('----');
                                Get.back();
                              },
                              child: Image.asset(emojiList[index],
                                  width: 40, height: 40),
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Container(
                      width: 350,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0x4dC4DDFF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                currentEmoji,
                                width: 40.0,
                                height: 40.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFieldWidget(
                      focusNode: textFocus,
                      controller: content,
                      validator: (value) {
                        editcontroller.content = value;
                      },
                      onchanged: (value) {
                        if (value.contains('.') || value.contains('...')) {
                          print('contain!!');
                          // textFocus.unfocus();
                          setState(() {
                            isVisible = true;
                          });
                        } else {
                          setState(() {
                            isVisible = false;
                          });
                        }
                        print(isVisible);
                      },
                      fieldTitle: '',
                      hintText: '100자 이내로 작성해주세요 :)',
                      maxLine: 10,
                      maxLength: 100,
                      borderRadius: 15.0,
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible ? true : false,
                  child: ButtonWidget(
                    label: '저장하기',
                    onTap: () {
                      print('저장 버튼 클릭');
                      Map<String, dynamic> map = {
                        'emoji': editcontroller.emoji,
                        'content': editcontroller.content,
                      };
                      print(map);
                      editcontroller.addDiaryToDB(map);
                    },
                    bgColor: const Color(0xb392B4EC),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
