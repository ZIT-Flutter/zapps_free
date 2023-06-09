import 'package:shared_preferences/shared_preferences.dart';

class SettingsLogics {
  static Future<bool> getBGMuscStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isMusic = prefs.getBool('bg_music') ?? true;

    return isMusic;
  }

  static Future<void> setBGMuscStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('bg_music', value);

    print('Music is ${value ? 'On' : 'Off'}');
  }

  static Future<void> setTimerStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('timer', value);

    print('Timer is ${value ? 'On' : 'Off'}');
  }

  static Future<bool> getTimerStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isTimer = prefs.getBool('timer') ?? true;

    return isTimer;
  }
}
