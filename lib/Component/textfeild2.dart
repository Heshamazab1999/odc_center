// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../constant.dart';

class TextFeildVerify extends StatelessWidget {
  TextFeildVerify({Key? key ,required this.name,this.keyboardType}) : super(key: key);
  var keyboardType;
  String name;

  @override
  Widget build(BuildContext context) {
    var hight=MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: hight * 0.09,
        width: 50,
        decoration: BoxDecoration(
            color: Constant.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.fromLTRB(20, 3, 3, 0),
        child:  Center(
          child: TextField(
            keyboardType:keyboardType ,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: name,

            ),
          ),
        ),
      ),
    );
  }
}
