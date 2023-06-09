import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapps/data/frog.dart';
import '../AppRoutes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/images/hbg.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
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
          Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      HomeScreenGameIcon(
                          argument: Snow,
                          imageLocation:
                              "assets/images/sequence_snow_icon.png"),
                      const SizedBox(height: 10),
                      HomeScreenGameIcon(
                          argument: Apple,
                          imageLocation:
                              "assets/images/sequence_apple_icon.png"),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      HomeScreenGameIcon(
                          argument: Fishingboy,
                          imageLocation:
                              "assets/images/sequence_fishingboy_icon.png"),
                      const SizedBox(height: 10),
                      HomeScreenGameIcon(
                          argument: Football,
                          imageLocation:
                              "assets/images/sequence_football_icon.png"),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      HomeScreenGameIcon(
                          argument: Rainyday,
                          imageLocation:
                              "assets/images/sequence_rainyday_icon.png"),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.moreScreen);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 143, 241, 98),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 5),
                                  blurRadius: 10.0)
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "More",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                        ),
                      ),
                    ],
                  ),
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
                  height: 50,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                      child: Text(
                    "Select a sequence card",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ],
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
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.gameScreen, arguments: argument);
      },
      child: Container(
        height: 80,
        width: 80,
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
