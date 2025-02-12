import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData({required String key}) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData({required String key, required value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log("SharedPrefHelper : setData with key : $key and value : $value");
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool({required String key}) async {
    log('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble({required String key}) async {
    log('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt({required String key}) async {
    log('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static Future<String> getString({required String key}) async {
    log('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// set secured string
  static setSecuredString({required String key, required value})async{
    log("setSecuredString : setSecuredString with key : $key and value : $value");
    const flutterSecureStorage = FlutterSecureStorage();
   return await flutterSecureStorage.write(key: key, value: value);
  }

  /// get secured string
  static getSecuredString({required String? key})async{
    log("getSecuredString : getSecuredString with key : $key");
    const flutterSecureStorage = FlutterSecureStorage();
   return await flutterSecureStorage.read(key: key ?? '');
  }

  /// delete All secured string
  static deleteAllSecuredString()async{
    log("deleteAllSecuredString");
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.deleteAll();
  }
}