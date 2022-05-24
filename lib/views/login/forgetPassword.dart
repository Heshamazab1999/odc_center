// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/controller/forgetpassword_controller.dart';
import 'package:odc_hackathon/views/login/verifyPassword.dart';

import '../../constant.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ForgetController());
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              " Froget Password",
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
                              child: Image.asset("assets/images/forget1.png"),
                            ),
                            const Text(
                              "Please enter your email address to recieve vervication code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                wordSpacing: 1,
                              ),
                            ),
                            Column(
                              children: [
                                TextFeild(
                                  name: "email",
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  onChange: (v) {
                                    _controller.email.value = v;
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
                                      _controller.forgetPassword();
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
