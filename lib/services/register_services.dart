import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/model/RegisterModel.dart';
import 'package:odc_hackathon/views/homePage/homPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterServices {
  final Dio _dio = Dio();
  RegisterModel? registerModel;

  register(String name, String email, String password, String phone,
      String address, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      Response response =
          await _dio.post(Constant.baseurl + Constant.register, data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address
      });
      if (response.statusCode == 200) {
        print(response.data);
        registerModel = RegisterModel.fromJson(response.data);
        print(registerModel!.data!.accessToken);
        prefs.setString("token", registerModel!.data!.accessToken!);
        prefs.setString(
            Constant.refreshToken, registerModel!.data!.refreshToken!);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        return registerModel;
      }
    } catch (e) {
      print(e);
    }
  }
}
