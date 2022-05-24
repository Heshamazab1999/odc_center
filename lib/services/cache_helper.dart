import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({String? key}) {
    return preferences!.get(key!);
  }

  static saveData({String? key, String? value}) async {
    return await preferences!.setString(key!, value!);
  }

  static removeData({String? key}) {
    return preferences!.remove(key!);
  }
}
