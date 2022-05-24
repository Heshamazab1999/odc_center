// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/Component/textfeild2.dart';
import 'package:odc_hackathon/controller/verifyotp_controller.dart';

import '../../constant.dart';
import 'creatNewPassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPassword extends StatelessWidget {
  const VerifyPassword({Key? key, this.email}) : super(key: key);
  final String? email;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(VerifyOtpController());
    var width = MediaQuery.of(context).size.width;
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
              " Verify Your Email",
              style: TextStyle(color: Colors.black),
            )),
        body: Obx(
          () => _controller.loading.value
              ? Center(
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
                            Container(
                              child:
                                  Image.asset("assets/images/verifypass.png"),
                            ),
                            Text(
                              "please enter the 4-digit code sent to $email",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                wordSpacing: 1,
                              ),
                            ),
                            Column(
                              children: [
                                PinCodeTextField(
                                  appContext: context,
                                  pastedTextStyle: TextStyle(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  length: 4,
                                  obscureText: false,

                                  blinkWhenObscuring: true,
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    if (v!.length < 3) {
                                      return "I'm from validator";
                                    } else {
                                      return null;
                                    }
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor: Colors.white,
                                  ),
                                  cursorColor: Colors.black,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  enableActiveFill: true,

                                  keyboardType: TextInputType.number,
                                  boxShadows: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                  onCompleted: (v) {
                                    _controller.otp.value = v;
                                    print(_controller.otp.value);
                                  },
                                  // onTap: () {
                                  //   print("Pressed");
                                  // },
                                  onChanged: (value) {
                                    _controller.otp.value = value;
                                    print(_controller.otp.value);
                                    debugPrint(value);
                                  },
                                  beforeTextPaste: (text) {
                                    debugPrint("Allowing to paste $text");
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: width * 0.95,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _controller.verifyOtp(email!);
                                    },
                                    child: const Text(
                                      "Send",
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
                                      padding: EdgeInsets.all(18),
                                      textStyle: TextStyle(fontSize: 18),
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
