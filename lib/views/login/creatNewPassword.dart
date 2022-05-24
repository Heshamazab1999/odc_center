// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/controller/createpassword_controller.dart';
import 'package:odc_hackathon/views/login/verifyPassword.dart';

import '../../constant.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({Key? key, this.otp, this.email}) : super(key: key);
  final String? email;
  final String? otp;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final _controller = Get.put(CreatePasswordController());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              " Create New Password",
              style: TextStyle(color: Colors.black),
            )),
        body: Obx(
          () => _controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/newpass.png"),
                            const Text(
                              "Enter your new password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 1,
                              ),
                            ),
                            Column(
                              children: [
                                TextFeild(
                                  name: "new password",
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  onChange: (v) {
                                    _controller.newPassword.value = v;
                                  },
                                ),
                                TextFeild(
                                  name: "confirm password",
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  onChange: (v) {
                                    _controller.confirmPassword.value = v;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: width * 0.95,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_controller.newPassword.value ==
                                          _controller.confirmPassword.value) {
                                        _controller.password.value =
                                            _controller.confirmPassword.value;
                                      } else {
                                        _controller.password.value = '';
                                      }
                                      _controller.resetPassword(email!, otp!);
                                    },
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Constant.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                      padding: const EdgeInsets.all(18),
                                      textStyle: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
