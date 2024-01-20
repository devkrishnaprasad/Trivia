import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trivia/pages/learder_board/learder_board.dart';
import 'package:trivia/pages/mcq/controller/mcq_controller.dart';
import 'package:trivia/pages/mcq/view/widgets/options.dart';

class MCQWidget extends StatefulWidget {
  const MCQWidget({Key? key}) : super(key: key);

  @override
  State<MCQWidget> createState() => _MCQWidgetState();
}

class _MCQWidgetState extends State<MCQWidget> {
  MCQController _mcqController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 81, 159, 224),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 90.w),
              child: const Text(
                "01:00",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (_mcqController.isloading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: double.infinity,
              // color: const Color.fromARGB(255, 81, 159, 224),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 10.w, top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Questions ${_mcqController.currentQuestionIndex.value + 1}/${_mcqController.questionsList.length}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (_mcqController.currentQuestionIndex.value !=
                                    0) {
                                  _mcqController.currentQuestionIndex - 1;
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (_mcqController.currentQuestionIndex.value !=
                                    _mcqController.questionsList.length - 1) {
                                  _mcqController.currentQuestionIndex + 1;
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 100.h, // Set a fixed height for the RoadMapWidget
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 10,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return const RoadMapWidget();
                  //     },
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 60.h, left: 10.w, right: 10.w, top: 30.h),
                    child: Container(
                      width: 500.w,
                      // height: 380.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.h, left: 10.w, right: 10.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${_mcqController.currentQuestionIndex.value + 1}.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _mcqController
                                            .questionsList[_mcqController
                                                .currentQuestionIndex.value]
                                            .questions,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0.sp,
                                        ),
                                        softWrap: true,
                                        maxLines: 4,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: SizedBox(
                                    height: 300.h,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: _mcqController
                                          .questionsList[_mcqController
                                              .currentQuestionIndex.value]
                                          .options
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return OptionsWidget(
                                          correctAnswer: _mcqController
                                              .questionsList[_mcqController
                                                  .currentQuestionIndex.value]
                                              .correctAnswer,
                                          points: _mcqController
                                              .questionsList[_mcqController
                                                  .currentQuestionIndex.value]
                                              .points,
                                          options: _mcqController
                                              .questionsList[_mcqController
                                                  .currentQuestionIndex.value]
                                              .options[index],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const LearderBoard());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 81, 159, 224),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Submit Test',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
