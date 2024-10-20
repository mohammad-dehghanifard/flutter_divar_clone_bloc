import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? preferences;

  SharedPreferencesManager._private();

  static final SharedPreferencesManager _instance = SharedPreferencesManager._private();

  factory SharedPreferencesManager(){
    return _instance;
  }

  // init prefs
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }
  // save string
  Future<void> saveString({required String key,required String value}) async => await preferences?.setString(key, value);
  // save int
  Future<void> saveInt({required String key,required int value}) async => await preferences?.setInt(key, value);
  // get string
  String? getString({required String key}) {
    return preferences?.getString(key);
  }
  // get int
  int? getInt({required String key}) {
    return preferences?.getInt(key);
  }
  // clear
  void clearPrefs() => preferences?.clear();
}