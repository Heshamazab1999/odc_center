// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Constant {
  static Color primary = const Color(0xffFF6600);

  static Color secondary = const Color(0xff3A3A3A);

  static Color grey = const Color(0xff9e9e9e);

  static Color blackColor = const Color(0xff1B1816);

  static Color lightWhit = const Color(0xffFCFCFC);

  static Color lightPrimary = const Color(0xCCd17d11);

  static Color grey1 = const Color(0xff979797);

  static const baseurl = 'https://d67c-196-205-94-85.eu.ngrok.io/api/v1/';
  static const login = 'login';
  static const register = 'register';
  static const forgetPassword = 'forgetPassword';
  static const verifyOtp = 'verifyOtp';
  static const resetPassword = 'resetPassword';
  static const categories = 'categories';
  static const profile = 'me';
  static const refreshToken = 'refreshToken';
  static const courses = 'courses';
  static const exams = 'exams';
  static const submit = 'submit';
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
