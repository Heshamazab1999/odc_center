import 'package:flutter/material.dart';
import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/services/login_services.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/views/homePage/homPage.dart';

class LoginController extends BaseController {
  final _services = LoginServices();
  final email = ''.obs;
  final password = ''.obs;
  final loading = false.obs;

  login(BuildContext context) async {
    loading.value = true;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _services.login(email.value, password.value, context);
        // Get.to(() => HomePage());
        loading.value = false;
      } else {
        print("Exception");
        loading.value = false;
      }
    } catch (e) {
      print(e);
      loading.value = false;

    }
  }
}
