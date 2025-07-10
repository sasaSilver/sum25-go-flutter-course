import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PreferencesService {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences instance
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Set string value in SharedPreferences
  static Future<void> setString(String key, String value) async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.setString(key, value);
  }

  // Get string value from SharedPreferences
  static String? getString(String key) {
    if (_prefs == null) {
      return null;
    }
    return _prefs!.getString(key);
  }

  // Set int value in SharedPreferences
  static Future<void> setInt(String key, int value) async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.setInt(key, value);
  }

  // Get int value from SharedPreferences
  static int? getInt(String key) {
    if (_prefs == null) {
      return null;
    }
    return _prefs!.getInt(key);
  }

  // Set bool value in SharedPreferences
  static Future<void> setBool(String key, bool value) async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.setBool(key, value);
  }

  // Get bool value from SharedPreferences
  static bool? getBool(String key) {
    if (_prefs == null) {
      return null;
    }
    return _prefs!.getBool(key);
  }

  // Set string list in SharedPreferences
  static Future<void> setStringList(String key, List<String> value) async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.setStringList(key, value);
  }

  // Get string list from SharedPreferences
  static List<String>? getStringList(String key) {
    if (_prefs == null) {
      return null;
    }
    return _prefs!.getStringList(key);
  }

  // Set object (as JSON string) in SharedPreferences
  static Future<void> setObject(String key, Map<String, dynamic> value) async {
    if (_prefs == null) {
      await init();
    }
    String jsonString = json.encode(value);
    await _prefs!.setString(key, jsonString);
  }

  // Get object from SharedPreferences
  static Map<String, dynamic>? getObject(String key) {
    if (_prefs == null) {
      return null;
    }
    String? jsonString = _prefs!.getString(key);
    if (jsonString == null) {
      return null;
    }
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  // Remove key from SharedPreferences
  static Future<void> remove(String key) async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.remove(key);
  }

  // Clear all data from SharedPreferences
  static Future<void> clear() async {
    if (_prefs == null) {
      await init();
    }
    await _prefs!.clear();
  }

  // Check if key exists in SharedPreferences
  static bool containsKey(String key) {
    if (_prefs == null) {
      return false;
    }
    return _prefs!.containsKey(key);
  }

  // Get all keys from SharedPreferences
  static Set<String> getAllKeys() {
    if (_prefs == null) {
      return {};
    }
    return _prefs!.getKeys();
  }
}
