// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:zapps/game_logics/score_logics.dart';

import '../components/screen_utils.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  int? highScore;

  @override
  void initState() {
    getScore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.screenWidth(context);
    double screenHeight = ScreenUtil.screenHeight(context);
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/images/score-bg.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: screenHeight * 0.06,
            left: screenWidth * 0.12,
            child: IconButton(
              iconSize: screenWidth * 0.08,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/icons/home_icon.png'),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "High Score",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  highScore == null ? "0" : highScore.toString(),
                  style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getScore() async {
    int getHighScore = await ScoreLogics.getHighScore();
    setState(() {
      highScore = getHighScore;
    });
  }
}
