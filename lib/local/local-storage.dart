import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  static save(String key, value) async {
    print(
        "============= LocalStorage save key =========== key: $key  || value: $value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(
        "============= LocalStorage get key =========== key: $key || value: ${prefs.get(key)}");
    return prefs.get(key);
  }

  static remove(String key) async {
    print("============= LocalStorage remove key =========== key: $key");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
