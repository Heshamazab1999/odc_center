import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/enum/view_state.dart';
import 'package:odc_hackathon/model/EnrollModel.dart';
import 'package:odc_hackathon/model/ExamModel.dart';
import 'package:odc_hackathon/services/enroll_course_services.dart';
import 'package:get/get.dart';

class EnrollController extends BaseController {
  static EnrollController to = Get.find();
  final _services = EnrollServicesCourse();
  EnrollModel? enrollModel;
  ExamModel? examModel;

  enrollCourse(int id) async {
    enrollModel = await _services.enrollCourse(id);
  }

  getExam(int code) async {
    setSate(ViewState.busy);
    examModel = await _services.getExam(code);
    setSate(ViewState.busy);
  }
}
