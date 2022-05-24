import 'package:dio/dio.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/model/CategoryDetails.dart';
import 'package:odc_hackathon/model/CategoryModel.dart';
import 'package:odc_hackathon/model/CoursesDetails.dart';
import 'package:odc_hackathon/model/CoursesModel.dart';
import 'package:odc_hackathon/views/courseDetail/CourseDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServices {
  final Dio _dio = Dio();

  getAllCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    try {
      Response response = await _dio.get(Constant.baseurl + Constant.categories,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return CategoryModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  getCategoryDetails(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    print(id);
    try {
      Response response =
          await _dio.get('${Constant.baseurl + Constant.categories}/$id',
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return CategoryDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  getAllCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    try {
      Response response = await _dio.get(Constant.baseurl + Constant.courses,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return CoursesModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  getAllCoursesDetails(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    try {
      Response response =
          await _dio.get('${Constant.baseurl + Constant.courses}/$id',
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return CoursesDetails.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
