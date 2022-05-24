// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed:()=>Get.back() ,
          icon:Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Privacy",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Policy",
                    style: TextStyle(
                        color: Color(0xffFF6600),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                      " sed do eiusmd tempor incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet,"
                      " consectetur adipiscing elit, sed do eiusmd tempor incididunt ut labore et dolore magna aliqua. "
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                      " sed do eiusmd tempor incididunt ut labore et dolore magna aliqua."
                      " Lorem ipsum dolor sit amet,"
                      " consectetur adipiscing elit,"
                      " sed do eiusmd tempor incididunt ut labore et dolore magna aliqua. "
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
