import 'package:dio/dio.dart';
import 'package:odc_hackathon/constant.dart';

class ForgetPasswordServices {
  final Dio _dio = Dio();

  forgetPassword(String email) async {
    try {
      Response response = await _dio.post(
          Constant.baseurl + Constant.forgetPassword,
          data: {"email": email});
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  changePassword(String email, String otp, String password) async {
    try {
      Response response = await _dio.post(
          Constant.baseurl + Constant.resetPassword,
          data: {"email": email, "otp": otp, "password": password});
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
