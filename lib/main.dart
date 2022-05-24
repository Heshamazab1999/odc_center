import 'package:flutter/material.dart';
import 'package:odc_hackathon/constant.dart';
import 'package:odc_hackathon/services/cache_helper.dart';
import 'package:odc_hackathon/views/OnBoardingScreen.dart';
import 'package:odc_hackathon/views/homePage/homPage.dart';
import 'package:odc_hackathon/views/quize/quiz_screen/quiz_screen.dart';
import 'package:odc_hackathon/views/quize/result_screen/result_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var token = CacheHelper.getData(key: "token");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: token == null ? MyApp() : const HomePage(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: OnboardingScreen(),
        image: Image.asset("assets/images/Logo.png"),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        useLoader: true,
      ),
    );
  }
}
