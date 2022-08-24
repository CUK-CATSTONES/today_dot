import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryContainerWidget extends StatelessWidget {
  final String date;
  final String content;
  final String emoji;

  const DiaryContainerWidget(
      {Key? key,
      required this.date,
      required this.content,
      required this.emoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  date,
                  textAlign: TextAlign.left,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 30),
                ),
                Image.asset(emoji, width: 40, height: 40),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 5, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '일기를 삭제할까요?',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () => Get.back(),
                                        icon: const Icon(
                                          Icons.close,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: const Text('취소',
                                            style: TextStyle(
                                                color: Color(0xff888585))),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Get.back(),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text(
                                          '확인',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
        Container(
          width: 335,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: const Color(0x4dC4DDFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                content,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          height: 20,
        ),
      ],
    );
  }
}
