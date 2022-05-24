import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/controller/enroll_controller.dart';
import 'package:odc_hackathon/controller/quiz_controller.dart';
import 'package:odc_hackathon/model/CoursesDetails.dart';
import 'package:odc_hackathon/views/quize/quiz.dart';
import 'package:odc_hackathon/views/quize/quiz_screen/quiz_screen.dart';
import '../../constant.dart';
import 'CourseDetailCodeSend.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({Key? key, this.details}) : super(key: key);
  final CoursesDetails? details;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(EnrollController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: 220,
                      child: Image.network(details!.data!.category!.imageUrl!),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11)),
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                    ),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Get.back(),
                          ),
                        ))
                  ])),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Learn ${details!.data!.courseName} for Beginners",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Author: Ahmed Abaza",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AlertDialoCodeSend(onTap: () async {
                await _controller.enrollCourse(details!.data!.id!);
                showDialog(
                    context,
                    _controller.enrollModel!.data!.userExam!.examCode
                        .toString(), () async {
                  await _controller.getExam(
                      _controller.enrollModel!.data!.userExam!.examCode!);

                  Get.to(() => Quiz(
                        examModel: _controller.examModel,
                        code:
                            _controller.enrollModel!.data!.userExam!.examCode!,
                      ));
                });
              }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "About this Course",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Welcome to your UX Design for Beginners Course. In the following tutorials,"
                " you'll get a thorough introduction to UX design,"
                "from its definition,"
                " areas and origins through to the skills you need to build a professional portfolio and become a UX designer. ",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.network_locked_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      details!.data!.courseLevel!,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Cairo",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You may be interested in",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/categoryicon3.png")),
                                borderRadius: BorderRadius.circular(11)),
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Learn ${details!.data!.courseName} for Beginners",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                "Ahmed Abaza",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Constant.grey1),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "15 Hours",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Constant.grey1),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Object?> showDialog(
    BuildContext context, String code, Function() onTap) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: SizedBox(
            height: 220,
            width: 200,
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/codesend.png"),
                    )),
                  ),
                  const Text(
                    "The Code has been Sent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.to(
                        showDialog2(context, code, onTap),
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constant.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.all(2),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<Object?> showDialog2(
    BuildContext context, String code, Function() onTap) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 180,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/codewrite.png"),
                    )),
                  ),
                  const Text(
                    "Enter the Code to Get your course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textField(code),
                  ElevatedButton(
                    onPressed: onTap,
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Constant.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.all(2),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Widget textField(String code) {
  return TextFormField(
    initialValue: code,
  );
}
