import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/enum/view_state.dart';
import 'package:odc_hackathon/model/CategoryDetails.dart';
import 'package:odc_hackathon/model/CategoryModel.dart';
import 'package:odc_hackathon/model/CoursesDetails.dart';
import 'package:odc_hackathon/model/CoursesModel.dart';
import 'package:odc_hackathon/services/home_services.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  static HomeController to = Get.find();
  final _services = HomeServices();
  CategoryModel? categoryModel;
  CategoryDetailsModel? detailsModel;
  CoursesModel? coursesModel;
  CoursesDetails? coursesDetails;

  @override
  Future<void> onInit() async {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    setSate(ViewState.busy);
    categoryModel = await _services.getAllCategories();
    coursesModel = await _services.getAllCourses();
    setSate(ViewState.idle);
  }

  getCategoryDetails(int id) async {
    detailsModel = await _services.getCategoryDetails(id);
  }

  getCoursesDetails(int id) async {
    coursesDetails = await _services.getAllCoursesDetails(id);
  }
}
