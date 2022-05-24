import 'package:dio/dio.dart';
import 'package:odc_hackathon/constant.dart';

class VerifyOtpServices {
  final Dio _dio = Dio();

  verifyOtp(String email, String otp) async {
    try {
      Response response = await _dio.post(Constant.baseurl + Constant.verifyOtp,
          data: {"email": email, "otp": otp});
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
