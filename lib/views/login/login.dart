import 'package:flutter/material.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/controller/login_controller.dart';
import 'package:odc_hackathon/views/login/forgetPassword.dart';
import 'package:odc_hackathon/views/signup/SignUp.dart';
import 'package:get/get.dart';

import '../homePage/homPage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Obx(
      () => _controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      top: -35,
                      right: -35,
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: -50,
                      left: -50,
                      child: Container(
                        height: 130,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //logo
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: Image.asset("assets/images/Logo.png"),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Welcome,",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Back!",
                                    style: TextStyle(
                                        color: Color(0xffFF6600),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Login",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Constant.secondary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  TextFeild(
                                    name: 'E-mail',
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    onChange: (v) {
                                      _controller.email.value = v;
                                      print(v);
                                    },
                                  ),
                                  TextFeild(
                                    name: 'Password',
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    onChange: (v) {
                                      _controller.password.value = v;
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: width * 0.6),
                                    child: TextButton(
                                      onPressed: () => Get.to(ForgetPassword()),
                                      child: Text(
                                        "ForgetPassword?",
                                        style: TextStyle(
                                          color: Constant.primary,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //login button
                              SizedBox(
                                height: 60,
                                width: width * 0.75,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _controller.login(context);
                                    // Get.to(HomePage());
                                  },
                                  child: const Text(
                                    "Login",
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
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't Have an Account?"),
                                  TextButton(
                                    onPressed: () => Get.to(SignUp()),
                                    child: const Text(
                                      'Sign up',
                                      style:
                                          TextStyle(color: Color(0xffFF6600)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    ));
  }
}
