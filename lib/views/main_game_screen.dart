// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zapps/components/screen_utils.dart';
import '../data/frog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final first = AudioPlayer();
  final second = AudioPlayer();
  final third = AudioPlayer();
  final fourth = AudioPlayer();
  List<Animal> all = [];
  final List<Animal> one = [];
  final List<Animal> two = [];
  final List<Animal> three = [];
  final List<Animal> four = [];
  int time = 0;
  void gameTimer() async {
    // timer on off
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('timerOnOff') == false) {
      if (mounted) {
        if (time < 20) {
          setState(() {
            time++;
          });
          await Future.delayed(const Duration(seconds: 2));
          gameTimer();
        }
      }
    } else {
      return;
    }
  }

  void resetTimer() async {
    if (mounted) {
      setState(() {
        time = -0;
        Future.delayed(const Duration(seconds: 4));
        setState(() {
          gameTimer();
        });
      });
    }
  }

  void musicOnOff() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool musicOnOff = prefs.getBool('musicOnOff') == false;
    if (mounted) {
      setState(() {
        if (musicOnOff) {
          prefs.setBool('musicOnOff', true);
        } else {
          prefs.setBool('musicOnOff', false);
        }
      });
    } else {
      return;
    }
  }

  void timerOnOff() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool timerOnOff = prefs.getBool('timerOnOff') ?? false;
    if (mounted) {
      setState(() {
        if (timerOnOff) {
          prefs.setBool('timerOnOff', true);
        } else {
          prefs.setBool('timerOnOff', false);
        }
      });
    }
  }

  @override
  void initState() {
    all.addAll(Get.arguments);
    playAudio();
    gameTimer();
    timerOnOff();
    musicOnOff();
    super.initState();
  }

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    third.dispose();
    fourth.dispose();
    playAudio();
    musicOnOff();
    timerOnOff();
    time;
    super.dispose();
  }

  void removeAll(Animal? toRemove) async {
    all.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
    one.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
    two.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
    three.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);
    four.removeWhere((animal) => animal.imageUrl == toRemove!.imageUrl);

    if (all.isEmpty) {
      await Get.generalDialog(
          pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          title: const Text('You won!'),
          content: Text('Your score is $score'),
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
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var highScore = prefs.getInt('HIGHSCORE');
      if (highScore == null || score > highScore) {
        prefs.setInt('HIGHSCORE', score);
      }
    }
  }

  int score = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final cardGap = screenWidth * 0.015;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/main.png'),
          fit: BoxFit.cover,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Back button
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            //Sequence Grid -----------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int index = 0; index < all.length; index++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTarget(
                            context,
                            text: '',
                            animals: [all[index]],
                            acceptTypes: AnimalType.values,
                            onAccept: (data) => setState(() {
                              removeAll(data);
                              all.add(data);
                            }),
                          ),
                          SizedBox(width: cardGap),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: cardGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildTarget(
                      context,
                      text: '1',
                      animals: one,
                      acceptTypes: [AnimalType.one],
                      onAccept: (data) {
                        setState(() {
                          one.remove(data);
                          one.add(data);
                        });
                        first.play();
                      },
                    ),
                    SizedBox(width: cardGap),
                    buildTarget(
                      context,
                      text: '2',
                      animals: two,
                      acceptTypes: [AnimalType.two],
                      onAccept: (data) {
                        setState(() {
                          removeAll(data);
                          two.add(data);
                        });
                        second.play();
                      },
                    ),
                    SizedBox(width: cardGap),
                    buildTarget(
                      context,
                      text: '3',
                      animals: three,
                      acceptTypes: [AnimalType.three],
                      onAccept: (data) {
                        setState(() {
                          removeAll(data);
                          three.add(data);
                        });
                        third.play();
                      },
                    ),
                    SizedBox(width: cardGap),
                    buildTarget(
                      context,
                      text: '4',
                      animals: four,
                      acceptTypes: [AnimalType.four],
                      onAccept: (data) {
                        setState(() {
                          removeAll(data);
                          four.add(data);
                        });
                        fourth.play();
                      },
                    ),
                    SizedBox(width: cardGap),
                  ],
                )
              ],
            ),
            //Score and info
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Score: $score",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: cardGap),
                Container(
                  alignment: Alignment.center,
                  width: 110,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    'Time: $time',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: cardGap),
                GestureDetector(
                  onTap: () {
                    resetTimer();
                  },
                  child: Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.restore,
                          size: 20,
                        ),
                        const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: cardGap * 0.2)
          ],
        ),
      ),
    );
  }

  void playAudio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var audio = prefs.getBool('musicOnOff');
    if (mounted) {
      if (audio == true) {
        setState(() {
          first.setAsset('assets/audios/first.mp3');
          second.setAsset('assets/audios/second.mp3');
          third.setAsset('assets/audios/third.mp3');
          fourth.setAsset('assets/audios/fourth.mp3');

          first.processingStateStream.listen((event) {
            if (event == ProcessingState.completed) {
              first.stop();
            }
          });

          second.processingStateStream.listen((event) {
            if (event == ProcessingState.completed) {
              second.stop();
            }
          });

          third.processingStateStream.listen((event) {
            if (event == ProcessingState.completed) {
              third.stop();
            }
          });

          fourth.processingStateStream.listen((event) {
            if (event == ProcessingState.completed) {
              fourth.stop();
            }
          });
        });
        print('audio is on');
      } else {
        print('audio off');
      }
    }
  }

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      Container(
        height: ScreenUtil.screenWidth(context) * 0.2,
        width: ScreenUtil.screenWidth(context) * 0.15,
        child: DragTarget<Animal>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              IgnorePointer(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 3),
                            blurRadius: 7.0,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...animals
                  .map(
                    (animal) => DraggableWidget(animal: animal),
                  )
                  .toList(),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              print('correct');
              setState(() {
                score += 10;
                all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            } else {
              setState(() {
                if (score >= 19) score -= 20;
              });

              print('wrong');
            }
            onAccept(data);
          },
        ),
      );
}

class DraggableWidget extends StatelessWidget {
  final Animal animal;

  const DraggableWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Draggable<Animal>(
        data: animal,
        feedback: buildImage(context, true),
        childWhenDragging: buildImage(context, false),
        child: buildImage(context, false),
      );

  Widget buildImage(context, isBig) {
    var cardHeight = ScreenUtil.screenWidth(context) * 0.2;
    var cardWidth = ScreenUtil.screenWidth(context) * 0.15;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          animal.imageUrl,
          height: isBig ? cardHeight * 1.2 : cardHeight,
          width: isBig ? cardWidth * 1.2 : cardWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
