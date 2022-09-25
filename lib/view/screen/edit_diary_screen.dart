import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view/widget/textfield_widget.dart';
import 'package:today_dot/view_model/edit_diary_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  late ScrollController _scrollController;

  TextEditingController content = TextEditingController();
  EditDiaryController editcontroller = EditDiaryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode textFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF9),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/home'),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (isVisible) {
                if (editcontroller.emoji == '') {
                  editcontroller.emoji = 'images/happy.png';
                }
                Map<String, dynamic> map = {
                  'emoji': editcontroller.emoji,
                  'content': editcontroller.content,
                };
                print(map);
                editcontroller.addDiaryToDB(map);
              } else
                null;
            },
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            child: Text(
              "저장",
              style: TextStyle(
                color: isVisible == true ? Colors.black : Colors.grey,
                fontFamily: 'Gmarket',
              ),
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            color: const Color(0xFFFFFDF9),
            child: Align(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    '지금 기분이 어때요?',
                    style: TextStyle(
                      fontSize: 28.0.sp,
                      fontFamily: 'cafe24',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Image.asset(
                    currentEmoji,
                    width: 70.w,
                    height: 70.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: const Color(0x4dC4DDFF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
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
                                Get.back();
                              },
                              child: Image.asset(emojiList[index],
                                  width: 40.w, height: 40.h),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFieldWidget(
                        focusNode: textFocus,
                        controller: content,
                        validator: (value) {
                          editcontroller.content = value;
                          return null;
                        },
                        onTap: () {
                          _scrollController.animateTo(140.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOutCirc);
                        },
                        onchanged: (value) {
                          if (value.contains('.') || value.contains('...')) {
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
                        maxLine: 10,
                        maxLength: 100,
                        borderRadius: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
