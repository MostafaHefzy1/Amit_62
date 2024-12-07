import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  static initSharedPreferencesHelper() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setString(key, value);
  }

  static getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static removeData({required String key}) {
    return sharedPreferences!.remove(key);
  }
}