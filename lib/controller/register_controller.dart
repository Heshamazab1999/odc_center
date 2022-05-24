import 'package:flutter/material.dart';
import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/services/register_services.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/views/homePage/homPage.dart';

class RegisterController extends BaseController {
  final _services = RegisterServices();
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final phone = ''.obs;
  final address = ''.obs;
  final loading = false.obs;

  register(BuildContext context) async {
    loading.value = true;
    try {
      if (name.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          phone.isNotEmpty &&
          address.isNotEmpty) {
        await _services.register(name.value, email.value, password.value,
            phone.value, address.value, context);
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
