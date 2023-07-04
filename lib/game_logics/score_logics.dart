import 'package:shared_preferences/shared_preferences.dart';

class ScoreLogics {
  static int calculateScore(int elapsedSeconds) {
    const int maxScore = 160;
    int remainingSeconds = maxScore - elapsedSeconds;
    int timeScore = remainingSeconds > 0 ? remainingSeconds : 0;
    int finalScore = 40 + timeScore;
    return finalScore;
  }

  static Future<int> getHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int highScore = prefs.getInt('high_score') ?? 0;
    print('Retrieved int value: $highScore');
    return highScore;
  }

  static void setNewHighScore(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('high_score', value);
    print('New High Score is: $value stored');
  }
}
