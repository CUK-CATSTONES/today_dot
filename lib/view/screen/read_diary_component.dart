import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today_dot/view_model/edit_diary_controller.dart';

class ReadDiaryComponent extends StatelessWidget {
  final _editDiaryController = Get.put(EditDiaryController());
  final String date;
  final String content;
  final String emoji;
  final String id;

  ReadDiaryComponent({
    Key? key,
    required this.date,
    required this.content,
    required this.emoji,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 339,
          height: 168,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0x4dC4DDFF),
          ),
          child: Column(
            children: [
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        date,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color(0xff979797),
                          fontSize: 15,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 30),
                      ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 5, 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '일기를 삭제할까요?',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child: const Text(
                                                '취소',
                                                style: TextStyle(
                                                  color: Color(0xff888585),
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                _editDiaryController
                                                    .deleteUserInfoInDB(id);
                                                Get.back();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              child: const Text(
                                                '확인',
                                                style: TextStyle(
                                                    color: Colors.black),
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
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(width: 13),
                  Image.asset(emoji, width: 60, height: 60),
                  // const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        content,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 20,
        ),
      ],
    );
  }
}
