import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/enum/view_state.dart';
import 'package:odc_hackathon/model/ExamModel.dart';
import 'package:odc_hackathon/services/enroll_course_services.dart';
import 'base_controller.dart';

class QuizController extends BaseController {
  final _services = EnrollServicesCourse();
  final boardController = PageController();
  final isLast = false.obs;
  final isFirst = true.obs;
  ExamModel? examModel;
  List<String> list = [];
  final value = 0.obs;

  isLastFunction(int index, int length) {
    if (index == length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  isFirstFunction(int index, int length) {
    if (index == length - 4) {
      isFirst.value = true;
    } else {
      isFirst.value = false;
    }
  }

  submitExam(int code) {
    _services.submitExam(code, list);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
