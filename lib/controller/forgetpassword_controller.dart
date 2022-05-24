import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/services/forgget_password.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/views/login/verifyPassword.dart';

class ForgetController extends BaseController {
  final _services = ForgetPasswordServices();
  final email = ''.obs;
  final loading = false.obs;

  forgetPassword() async {
    loading.value = true;
    try {
      if (email.isNotEmpty) {
        await _services.forgetPassword(email.value);
        Get.to(() => VerifyPassword(
              email: email.value,
            ));
        loading.value = false;
      } else {
        loading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
