import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/model/LoginModel.dart';
import 'package:odc_hackathon/model/RefreshModel.dart';
import 'package:odc_hackathon/services/cache_helper.dart';
import 'package:odc_hackathon/views/homePage/homPage.dart';

class LoginServices {
  final Dio _dio = Dio();
  LoginModel? loginModel;
  RefreshModel? refreshModel;

  getRefreshToken() async {
    var token = CacheHelper.getData(key: "token");

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
        CacheHelper.saveData(
            key: "accessToken", value: refreshModel!.data!.accessToken);
        return refreshModel;
      }
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      Response response = await _dio.post(Constant.baseurl + Constant.login,
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        print(response.data);
        loginModel = LoginModel.fromJson(response.data);
        print(loginModel!.data!.accessToken);
        CacheHelper.saveData(
            key: "token", value: loginModel!.data!.accessToken!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        return loginModel;
      }
    } catch (e) {
      print(e);
    }
  }
}
