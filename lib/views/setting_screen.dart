// ignore_for_file: depend_on_referenced_packages, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zapps/components/screen_utils.dart';
import 'package:zapps/game_logics/setting_logics.dart';

import '../AppRoutes.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isMusicOn = false;

  @override
  void initState() {
    getBGMusicStatus();
    super.initState();
  }

  void getBGMusicStatus() async {
    bool isMO = await SettingsLogics.getBGMuscStatus();
    setState(() {
      isMusicOn = isMO;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/icons/v.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black54,
              iconSize: ScreenUtil.screenWidth(context) * 0.05,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage("assets/icons/timer.png"),
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/icons/music.png"),
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.scoreScreen);
                        },
                        child: const Image(
                          image: AssetImage("assets/icons/score.png"),
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // pop up dialog
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Timer On/Off"),
                              content: const Text(
                                  "Do you want to turn on the timer?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("No"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool("timerOnOff", false);
                                    Get.back();
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          "Timer On/Off",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Music On/Off",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                      const SizedBox(
                        height: 32,
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.scoreScreen);
                          },
                          child: const Text(
                            "High Score",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
