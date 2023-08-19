// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, must_be_immutable, use_build_context_synchronously

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zapps/components/constants.dart';
import 'package:zapps/data/sequence_data.dart';
import 'package:zapps/game_logics/score_logics.dart';
import 'package:zapps/game_logics/setting_logics.dart';

import '../components/screen_utils.dart';

class GameScreenTest extends StatefulWidget {
  List<SequenceCardInfo> sequenceList;

  GameScreenTest({
    Key? key,
    required this.sequenceList,
  }) : super(key: key);

  @override
  State<GameScreenTest> createState() => _GameScreenTestState();
}

class _GameScreenTestState extends State<GameScreenTest> {
  late AudioPlayer audioPlayer = AudioPlayer();
  bool isMusicPlaying = false;

  playBackgroundMusic() async {
    await audioPlayer.play(AssetSource('audios/bg_music_1.mp3'));
  }

  List<int> draggableItems = [1, 2, 3, 4];
  Random random = Random();
  late double screenWidth;
  late double cardHeight;
  late double cardWidth;
  int score = 0;
  int _timerValue = 0;
  bool _paused = true;
  final _periodicStream =
      Stream.periodic(const Duration(milliseconds: 1000), (i) => i);
  int previousStreamValue = 0;

  void setBGMusic() async {
    bool isMo = await SettingsLogics.getBGMuscStatus();

    setState(() {
      isMusicPlaying = isMo;
    });

    if (isMusicPlaying) {
      playBackgroundMusic();
    }
  }

  @override
  void initState() {
    setBGMusic();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = ScreenUtil.screenWidth(context);
    cardHeight = screenWidth * 0.2;
    cardWidth = screenWidth * 0.15;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/main.png'),
          fit: BoxFit.cover,
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: screenWidth > 700
                  ? EdgeInsets.only(left: 20, top: 20)
                  : EdgeInsets.all(0),
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/back-button.png'),
                // CircleAvatar(
                //   minRadius: 40,
                //   backgroundColor: ColorPallate.white,
                //   child: Image.asset('assets/images/back-button.png'),
                // ),
                iconSize: screenWidth * 0.06,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildRowWithRandomDragable(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 1; i <= 4; i++)
                            dragTargetContainer(i, widget.sequenceList),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Score and Timer Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isMusicPlaying = !isMusicPlaying;
                          if (isMusicPlaying) {
                            audioPlayer
                                .play(AssetSource('audios/bg_music_1.mp3'));
                          } else {
                            audioPlayer.pause();
                          }
                        });

                        SettingsLogics.setBGMuscStatus(isMusicPlaying);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Music',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: ColorPallate.blue),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              isMusicPlaying
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              size: screenWidth * 0.03,
                              color: isMusicPlaying
                                  ? ColorPallate.blue
                                  : ColorPallate.red,
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: ColorPallate.yellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextHeading(label: 'Score: $score'),
                                SizedBox(height: screenWidth * 0.015),
                                StreamBuilder(
                                    stream: _periodicStream,
                                    builder:
                                        (context, AsyncSnapshot<int> snapshot) {
                                      if (snapshot.hasData !=
                                              previousStreamValue &&
                                          snapshot.data != null) {
                                        previousStreamValue = snapshot.data!;
                                        if (!_paused) {
                                          _timerValue++;
                                        }
                                      }

                                      return TextHeading(
                                          label: 'Time: $_timerValue s');
                                    }),
                                SizedBox(height: screenWidth * 0.015),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: ColorPallate.blue),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GameScreenTest(
                                                    sequenceList:
                                                        widget.sequenceList)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.refresh),
                                        Text(
                                          'Reset',
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 1.2,
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text TextHeading({required String label}) {
    return Text(
      label,
      // 'Score: $score',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.03,
          color: ColorPallate.blue),
    );
  }

  DragTarget<SequenceCardInfo> dragTargetContainer(
      int targetSerial, List<SequenceCardInfo> sequenceList) {
    return DragTarget(
      onAccept: (SequenceCardInfo data) {
        setState(() {
          draggableItems.remove(targetSerial);
          score += 10;
          if (draggableItems.isEmpty) {
            setState(() {
              _paused = true;
            });

            showDialog(
                context: context,
                builder: (context) {
                  int finalScore = ScoreLogics.calculateScore(_timerValue);

                  return FutureBuilder<int>(
                      future: ScoreLogics.getHighScore(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (finalScore > snapshot.data!) {
                            ScoreLogics.setNewHighScore(finalScore);
                          }
                          return AlertDialog(
                            title: Text('You won!!'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Your Score is: $finalScore'),
                                Text('Total Time: $_timerValue seconds'),
                              ],
                            ),
                            actions: <Widget>[
                              RawMaterialButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      });
                });
          }
        });
        print('Accepted');
      },
      builder: (context, accepted, rejected) {
        return Container(
          margin: EdgeInsets.only(left: 10),
          width: cardWidth,
          height: cardHeight,
          child: Center(
            // sequenceList[targetSerial - 1].imageLocation
            child: accepted.isEmpty
                ? !draggableItems.contains(targetSerial)
                    ?
                    //
                    Container(
                        decoration: cardDecoration,
                        child: imageCard(
                            sequenceList[targetSerial - 1].imageLocation))
                    : Container(
                        decoration: cardDecoration,
                        width: cardWidth,
                        height: cardHeight,
                        child: Center(
                            child: Text(
                          '$targetSerial',
                          style: cardTextStyle,
                        )),
                      )
                : Container(
                    width: cardWidth,
                    height: cardHeight,
                    decoration: getCardDecoration(Colors.greenAccent),
                    child: Center(
                        child: Text(
                      '$targetSerial',
                      style: cardTextStyle,
                    ))),
          ),
        );
      },
      onWillAccept: (SequenceCardInfo? data) {
        print('Drag serial is: ${data?.serial}');
        print('Target serial is: $targetSerial');
        if (data?.serial == targetSerial) {
          print('Yes');
          return true;
        }
        print('No');
        return false;
      },
    );
  }

  ClipRRect imageCard(String imageLocation) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imageLocation));
  }

  Row buildRowWithRandomDragable() {
    // Shuffle the list of Sequence randomly
    if (_paused) {
      draggableItems.shuffle(random);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: draggableItems.map((number) {
        return dragableCard(widget.sequenceList, number);
      }).toList(),
    );
  }

  Draggable<SequenceCardInfo> dragableCard(
      List<SequenceCardInfo> sequenceList, int serial) {
    return Draggable(
      data: sequenceList[serial - 1],
      child: Container(
        decoration: cardDecoration,
        margin: EdgeInsets.only(left: 10),
        width: cardWidth,
        height: cardHeight,
        child: Center(child: imageCard(sequenceList[serial - 1].imageLocation)),
      ),
      onDragStarted: () {
        setState(() {
          _paused = false;
        });
      },
      childWhenDragging: Container(
        margin: EdgeInsets.only(left: 10),
        width: cardWidth,
        height: cardHeight,
        decoration: cardDecoration,
      ),
      onDraggableCanceled: ((velocity, offset) {}),
      feedback: Container(
        width: cardWidth * 0.9,
        height: cardHeight * 0.9,
        decoration: cardDecoration,
        child: Center(
          child:
              Center(child: imageCard(sequenceList[serial - 1].imageLocation)),
        ),
      ),
    );
  }
}
