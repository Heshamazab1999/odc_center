import 'package:odc_hackathon/controller/base_controller.dart';
import 'package:odc_hackathon/services/verifyotp_services.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/views/login/creatNewPassword.dart';

class VerifyOtpController extends BaseController {
  final _services = VerifyOtpServices();
  final otp = ''.obs;
  final loading = false.obs;

  verifyOtp(String email) async {
    loading.value = true;
    try {
      if (otp.isNotEmpty) {
        await _services.verifyOtp(email, otp.value);
        Get.to(() => CreateNewPassword(
              email: email,
              otp: otp.value,
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
