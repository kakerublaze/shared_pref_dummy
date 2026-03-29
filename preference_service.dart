import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'pref_keys.dart';
import 'models/user_model.dart';
import 'models/product_model.dart';

class PreferenceService {
  static SharedPreferences? _prefs;

  /// Initialize (call in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// =========================
  /// 🔹 BOOL
  /// =========================
  static bool get isLoggedIn =>
      _prefs?.getBool(PrefKeys.isLoggedIn) ?? false;

  static set isLoggedIn(bool value) =>
      _prefs?.setBool(PrefKeys.isLoggedIn, value);

  /// =========================
  /// 🔹 STRING
  /// =========================
  static String get email =>
      _prefs?.getString(PrefKeys.email) ?? "";

  static set email(String value) =>
      _prefs?.setString(PrefKeys.email, value);

  static String get token =>
      _prefs?.getString(PrefKeys.token) ?? "";

  static set token(String value) =>
      _prefs?.setString(PrefKeys.token, value);

  /// =========================
  /// 🔹 CUSTOM OBJECT
  /// =========================
  static UserModel get user {
    final data = _prefs?.getString(PrefKeys.user);
    if (data == null || data.isEmpty) return UserModel();

    return UserModel.fromJson(jsonDecode(data));
  }

  static set user(UserModel value) =>
      _prefs?.setString(PrefKeys.user, jsonEncode(value.toJson()));

  /// =========================
  /// 🔹 LIST OF OBJECTS
  /// =========================
  static List<ProductModel> get productList {
    final data = _prefs?.getString(PrefKeys.productList);
    if (data == null || data.isEmpty) return [];

    return List<ProductModel>.from(
      jsonDecode(data).map((e) => ProductModel.fromJson(e)),
    );
  }

  static set productList(List<ProductModel> value) =>
      _prefs?.setString(
        PrefKeys.productList,
        jsonEncode(value.map((e) => e.toJson()).toList()),
      );

  /// =========================
  /// 🔹 CLEAR
  /// =========================
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }

  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }
}
