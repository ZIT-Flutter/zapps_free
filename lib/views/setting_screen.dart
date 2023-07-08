// ignore_for_file: depend_on_referenced_packages, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zapps/components/screen_utils.dart';
import 'package:zapps/game_logics/setting_logics.dart';
import 'package:zapps/views/scores_screen.dart';

import '../AppRoutes.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isMusicOn = false;
  bool timerStatus = false;

  late double screenWidth;

  @override
  void initState() {
    getBGMusicStatus();
    getTimerStatus();
    super.initState();
  }

  void getBGMusicStatus() async {
    bool isMO = await SettingsLogics.getBGMuscStatus();
    setState(() {
      isMusicOn = isMO;
    });
  }

  void getTimerStatus() async {
    bool isTimer = await SettingsLogics.getTimerStatus();
    setState(() {
      timerStatus = isTimer;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = ScreenUtil.screenWidth(context);
    return Scaffold(
      body: Container(
        height: ScreenUtil.screenHeight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/settings_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        iconSize: screenWidth * 0.08,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset('assets/icons/home_icon.png'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.withOpacity(0.3),
                  ),
                  width: screenWidth * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SettingItemWidget(
                              iconImage: 'assets/icons/clock_icon_128.png',
                              title: 'Timer',
                            ),
                            Switch(
                                value: timerStatus,
                                onChanged: (value) {
                                  setState(() {
                                    timerStatus = !timerStatus;
                                  });

                                  SettingsLogics.setTimerStatus(timerStatus);
                                })
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SettingItemWidget(
                              iconImage: 'assets/icons/music_icon_128.png',
                              title: 'Music',
                            ),
                            Switch(
                                value: isMusicOn,
                                onChanged: (value) {
                                  setState(() {
                                    isMusicOn = !isMusicOn;
                                  });

                                  SettingsLogics.setBGMuscStatus(isMusicOn);
                                })
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                print('Hi');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScoresScreen()));
                              },
                              child: SettingItemWidget(
                                iconImage: 'assets/icons/score.png',
                                title: 'High Score',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingItemWidget extends StatefulWidget {
  // final VoidCallback? onPressed;
  final String iconImage;
  final String title;

  const SettingItemWidget({
    Key? key,
    // this.onPressed,
    required this.iconImage,
    required this.title,
  }) : super(key: key);

  @override
  State<SettingItemWidget> createState() => _SettingItemWidgetState();
}

class _SettingItemWidgetState extends State<SettingItemWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.screenWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.iconImage, width: screenWidth * 0.06),
        const SizedBox(width: 20),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
