import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/model/RefreshModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class RefreshTokenServices {
  final Dio _dio = Dio();
  RefreshModel? refreshModel;

  getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Constant.refreshToken);
    print(token);
    try {
      Response response =
          await _dio.post(Constant.baseurl + Constant.refreshToken,
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        print(response.data);
        refreshModel = RefreshModel.fromJson(response.data);
        prefs.setString("Token", refreshModel!.data!.refreshToken!);
        return refreshModel;
      }
    } catch (e) {
      print(e);
    }
  }
}
