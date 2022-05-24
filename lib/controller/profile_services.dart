import 'package:dio/dio.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  final Dio _dio = Dio();

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    try {
      Response response = await _dio.get(Constant.baseurl + Constant.profile,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        print("ccccc${response.data}");

      }
    } catch (e) {
      print(e);
    }
  }
}
