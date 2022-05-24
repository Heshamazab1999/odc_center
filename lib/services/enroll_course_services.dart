import 'package:dio/dio.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/model/EnrollModel.dart';
import 'package:odc_hackathon/model/ExamModel.dart';
import 'package:odc_hackathon/services/cache_helper.dart';

class EnrollServicesCourse {
  final Dio _dio = Dio();

  enrollCourse(int id) async {
    var token = CacheHelper.getData(key: "token");

    try {
      Response response =
          await _dio.post("${Constant.baseurl}courses/$id/enroll",
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return EnrollModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  getExam(int code) async {
    var token = CacheHelper.getData(key: "token");

    try {
      Response response =
          await _dio.get("${Constant.baseurl + Constant.exams}/$code",
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return ExamModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  submitExam(int code, List<String> list) async {
    var token = CacheHelper.getData(key: "token");
print(list);
    try {
      Response response = await _dio.post(
          "${Constant.baseurl + Constant.exams}/$code/${Constant.submit}",
          data: {
            "answers": list
          },
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
