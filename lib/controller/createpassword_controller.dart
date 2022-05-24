import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/services/forgget_password.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/views/login/login.dart';

class CreatePasswordController extends BaseController {
  final _services = ForgetPasswordServices();
  final newPassword = ''.obs;
  final confirmPassword = ''.obs;
  final password = ''.obs;
  final loading = false.obs;


  resetPassword(String email, String otp) async {
    loading.value = true;

    try {
      if (newPassword.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password.isNotEmpty) {
        await _services.changePassword(email, otp, password.value);
        Get.to(()=>const Login());
        loading.value = false;

      } else {
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;

      print(e);
    }
  }
}
