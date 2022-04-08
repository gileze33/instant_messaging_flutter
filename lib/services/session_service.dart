import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionService {
  Future<String?> getSessionKey();
  Future<void> saveSessionKey(String sessionKey);
}

class SessionServiceImpl extends SessionService {
  static const _sessionKeyPreference = 'session';

  @override
  Future<String?> getSessionKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sessionKeyPreference);
  }

  @override
  Future<void> saveSessionKey(String sessionKey) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_sessionKeyPreference, sessionKey);
  }
}