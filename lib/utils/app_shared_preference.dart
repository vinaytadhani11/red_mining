import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static Future<SharedPreferences?> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }

  static Future<void> deleteByKey(String key) async {
    await _prefsInstance!.remove(key);
  }

  static Future<void> delete() async {
    await _prefsInstance!.clear();
  }

  static Future<bool?> setString(String key, String value) async {
    var prefs = await _instance;
    return await prefs?.setString(key, value);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool?> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value);
  }

  static Future<bool?> setToken(String value) async {
    var prefs = await _instance;
    return await prefs?.setString(SP.token, value);
  }

  static String get getToken {
    return _prefsInstance!.getString(SP.token) ?? "";
  }

  static Future<bool?> setFCMToken(String value) async {
    var prefs = await _instance;
    return await prefs?.setString(SP.fcmToken, value);
  }

  static String get getFCMToken {
    return _prefsInstance!.getString(SP.fcmToken) ?? "";
  }

  static Future<bool?> setUid(String value) async {
    var prefs = await _instance;
    return await prefs?.setString(SP.UID, value);
  }

  static String get getUID {
    return _prefsInstance!.getString(SP.UID) ?? "0";
  }

  static Future<bool?> setUserKey(String value) async {
    var prefs = await _instance;
    return await prefs?.setString(SP.userKey, value);
  }

  static String get getUserKey {
    return _prefsInstance!.getString(SP.userKey) ?? "0";
  }

  static String get getUserName {
    return _prefsInstance!.getString(SP.userName) ?? "";
  }
}

class SP {
  static const String UID = "UID";
  static const String userName = "userName";
  static const String token = "token";
  static const String fcmToken = "fcm_token";
  static const String userKey = "user_key";
  static const String referral = "referral";
}
