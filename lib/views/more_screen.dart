import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapps/data/frog.dart';
import '../AppRoutes.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<String> sequence_icons = [
    'assets/images/sequence_snow_icon.png',
    'assets/images/sequence_fishingboy_icon.png',
    'assets/images/sequence_rainyday_icon.png',
    'assets/images/sequence_apple_icon.png',
    'assets/images/sequence_football_icon.png',
    'assets/images/sequence_waterlily_icon.png',
    'assets/images/sequence_watermelon_icon.png',
    'assets/images/sequence_dolphin_icon.png',
    'assets/images/sequence_season_icon.png',
    'assets/images/sequence_santa_icon.png',
    'assets/images/sequence_spacemission_icon.png',
    'assets/images/sequence_lifestage_icon.png',
    'assets/images/sequence_omlet_icon.png',
    'assets/images/sequence_brushing_icon.png',
    'assets/images/sequence_bearfishing_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/images/mbg.png",
              opacity: const AlwaysStoppedAnimation(.8),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 15,
            top: 10,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6),
                        itemCount: 24,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 5),
                                    blurRadius: 10.0)
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: InkWell(
                                onTap: () {
                                  if (index < sequence_icons.length) {
                                    print(sequence_icons[index]);

                                    Get.toNamed(
                                      AppRoutes.gameScreen,
                                      arguments:
                                          gameArgument(sequence_icons[index]),
                                    );
                                  } else {
                                    Get.toNamed(AppRoutes.gameScreen,
                                        arguments: Dolphin);
                                  }
                                },
                                // print('Click= $index'),
                                child: Image(
                                  image: index < sequence_icons.length
                                      ? AssetImage(sequence_icons[index])
                                      : const AssetImage(
                                          "assets/images/lock.png"),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          );
                        })),
              ),
              const SizedBox(
                height: 10,
              ),
              // InkWell(
              //   onTap: () {
              //     // push(context: context, widget: const InAppPurchaseScreen());
              //   },
              //   child: Container(
              //     height: 35,
              //     width: 160,
              //     decoration: BoxDecoration(
              //       color: Colors.lightGreenAccent,
              //       border: Border.all(color: Colors.black, width: 1),
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: const Center(
              //         child: Text(
              //       "Unlock All Levels",
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              //     )),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 'assets/images/sequence_snow_icon.png'
// 'assets/images/sequence_fishingboy_icon.png'
// 'assets/images/sequence_rainyday_icon.png'
// 'assets/images/sequence_apple_icon.png'
// 'assets/images/sequence_football_icon.png'
// 'assets/images/sequence_waterlily_icon.png'
// 'assets/images/sequence_watermelon_icon.png'
// 'assets/images/sequence_dolphin_icon.png'
// 'assets/images/sequence_season_icon.png'
// 'assets/images/sequence_santa_icon.png'
// 'assets/images/sequence_spacemission_icon.png'
// 'assets/images/sequence_lifestage_icon.png'
// 'assets/images/sequence_omlet_icon.png'
// 'assets/images/sequence_brushing_icon.png'
// 'assets/images/sequence_bearfishing_icon.png'

gameArgument(String sequenceIcon) {
  if (sequenceIcon.isNotEmpty) {
    switch (sequenceIcon) {
      case 'assets/images/sequence_snow_icon.png':
        {
          return Snow;
        }
      case 'assets/images/sequence_fishingboy_icon.png':
        {
          return Fishingboy;
        }
      case 'assets/images/sequence_rainyday_icon.png':
        {
          return Rainyday;
        }

      case 'assets/images/sequence_apple_icon.png':
        {
          return Apple;
        }

      case 'assets/images/sequence_football_icon.png':
        {
          return Football;
        }

      case 'assets/images/sequence_waterlily_icon.png':
        {
          return Waterlily;
        }

      case 'assets/images/sequence_watermelon_icon.png':
        {
          return Watermelon;
        }

      case 'assets/images/sequence_dolphin_icon.png':
        {
          return Dolphin;
        }

      case 'assets/images/sequence_season_icon.png':
        {
          return Seasons;
        }

      case 'assets/images/sequence_santa_icon.png':
        {
          return Santa;
        }

      case 'assets/images/sequence_spacemission_icon.png':
        {
          return SpaceMission;
        }

      case 'assets/images/sequence_lifestage_icon.png':
        {
          return LifeStage;
        }

      case 'assets/images/sequence_omlet_icon.png':
        {
          return Omlet;
        }

      case 'assets/images/sequence_brushing_icon.png':
        {
          return Brushing;
        }

      case 'assets/images/sequence_bearfishing_icon.png':
        {
          return BearFishing;
        }

      default:
        {
          return Dolphin;
        }
    }
  }
}
