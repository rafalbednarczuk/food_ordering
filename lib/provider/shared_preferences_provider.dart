import 'dart:convert';

import 'package:food_ordering/model/user/user.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _userSpKey = "USER_SP_KEY";

class SharedPreferencesProvider {
  static SharedPreferencesProvider _provider;
  final BehaviorSubject<SharedPreferences> _preferences;

  factory SharedPreferencesProvider() {
    if (_provider == null) {
      _provider = SharedPreferencesProvider._init();
    }
    return _provider;
  }

  SharedPreferencesProvider._init() : _preferences = BehaviorSubject() {
    _addSharedPreferencesInstance();
  }

  void _addSharedPreferencesInstance() async {
    _preferences.add(await SharedPreferences.getInstance());
  }

  Future<User> getUser() async {
    final userJson = (await _preferences.first).getString(_userSpKey);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  Future<void> setUser(User user) async {
    if (user == null) {
      await (await _preferences.first).setString(_userSpKey, null);
      return;
    }
    await (await _preferences.first)
        .setString(_userSpKey, jsonEncode(user.toJson()));
  }
}
