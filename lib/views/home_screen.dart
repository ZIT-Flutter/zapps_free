// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapps/components/screen_utils.dart';
import 'package:zapps/data/frog.dart';
import 'package:zapps/test/sequence_data.dart';
import '../AppRoutes.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../test/game_screen_new.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil.screenHeight(context),
              width: ScreenUtil.screenWidth(context),
              child: Image.asset(
                "assets/images/hbg.png",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingsScreen);
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeScreenSVGIcon(
                          argument: Snow,
                          imageLocation: 'assets/images/rain1.svg'),
                      // HomeScreenGameIcon(
                      //     argument: Snow,
                      //     imageLocation: "assets/images/rain1.svg"),
                      const SizedBox(width: 20),
                      HomeScreenGameIcon(
                          argument: Apple,
                          imageLocation:
                              "assets/images/sequence_apple_icon.png"),
                      const SizedBox(width: 20),
                      HomeScreenGameIcon(
                          argument: Fishingboy,
                          imageLocation:
                              "assets/images/sequence_fishingboy_icon.png"),
                      const SizedBox(width: 20),
                      HomeScreenGameIcon(
                          argument: Football,
                          imageLocation:
                              "assets/images/sequence_football_icon.png"),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(AppRoutes.GAMESCREEN, arguments: Mosquito);
                    },
                    child: Container(
                      // height: 50,
                      // width: 220,

                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 200),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 127, 211, 245),
                        // border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                          child: Text(
                        "Select a sequence card",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameScreenTest(sequenceList: sequence_1)));
                      },
                      child: Text('Test New Game Screen'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenGameIcon extends StatelessWidget {
  const HomeScreenGameIcon({
    Key? key,
    required this.argument,
    required this.imageLocation,
  }) : super(key: key);

  final List<Animal> argument;
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired icon size based on screen dimensions
    final iconSize = screenWidth * 0.15; // Adjust the multiplier as needed
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen, arguments: argument);
      },
      child: Container(
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 5), blurRadius: 10.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            image: AssetImage(imageLocation),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HomeScreenSVGIcon extends StatelessWidget {
  const HomeScreenSVGIcon({
    Key? key,
    required this.argument,
    required this.imageLocation,
  }) : super(key: key);

  final List<Animal> argument;
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired icon size based on screen dimensions
    final iconSize = screenWidth * 0.15; // Adjust the multiplier as needed
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen, arguments: argument);
      },
      child: Container(
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 5), blurRadius: 10.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SvgPicture.asset(
            imageLocation,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
