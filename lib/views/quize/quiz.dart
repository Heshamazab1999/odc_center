import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/controller/quiz_controller.dart';
import 'package:odc_hackathon/model/ExamModel.dart';

class Quiz extends StatelessWidget {
  final controller = Get.put(QuizController());

  Quiz({Key? key, this.examModel, this.code}) : super(key: key);
  final ExamModel? examModel;
  final int? code;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.boardController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(examModel!.data![index].question!),
                        GestureDetector(
                          onTap: () {
                            controller.list
                                .add(examModel!.data![index].answer1.toString());
                            print(controller.list);

                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Constant.lightWhit,
                                  border: Border.all(color: Constant.primary)),
                              child: Center(
                                  child:
                                      Text(examModel!.data![index].answer1!))),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.list
                                .add(examModel!.data![index].answer2!);
                            print(controller.list);

                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Constant.lightWhit,
                                  border: Border.all(color: Constant.primary)),
                              child: Center(
                                  child:
                                      Text(examModel!.data![index].answer2!))),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.list
                                .add(examModel!.data![index].answer3!);
                            print(controller.list);

                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Constant.lightWhit,
                                  border: Border.all(color: Constant.primary)),
                              child: Center(
                                  child:
                                      Text(examModel!.data![index].answer3!))),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.list
                                .add(examModel!.data![index].answer4!);
                            print(controller.list);
                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Constant.lightWhit,
                                  border: Border.all(color: Constant.primary)),
                              child: Center(
                                  child:
                                      Text(examModel!.data![index].answer4!))),
                        ),
                      ],
                    );
                  },
                  itemCount: examModel!.data!.length,
                  onPageChanged: (int index) {
                    controller.isFirstFunction(index, examModel!.data!.length);
                    controller.isLastFunction(index, examModel!.data!.length);
                  },
                ),
              ),
              Obx(() => controller.isLast.value
                  ? Center(
                      child: TextButton(
                          onPressed: () {
                            // print(controller.list.toJson());
                            print(controller.list.length);
                            controller.submitExam(code!);
                            // controller.list.clear();
                          },
                          child: Text("Submit")))
                  : FloatingActionButton(
                      onPressed: () {
                        controller.value.value = 0;
                        if (controller.isLast.value) {}
                        controller.boardController.nextPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease);
                      },
                      heroTag: "First",
                      child: Icon(Icons.arrow_forward),
                      backgroundColor: Colors.deepOrange,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
