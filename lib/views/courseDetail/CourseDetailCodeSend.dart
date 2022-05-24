// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_hackathon/Component/textFeild.dart';
import 'package:odc_hackathon/views/quize/quiz_screen/quiz_screen.dart';
import '../../constant.dart';
import '../../controller/quiz_controller.dart';

class AlertDialoCodeSend extends StatelessWidget {
  const AlertDialoCodeSend({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(
          "Get Course",
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
    );
  }


}
