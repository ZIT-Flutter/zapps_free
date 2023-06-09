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
      body: Center(
        child: Stack(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenGameIcon(
                        argument: Snow,
                        imageLocation: "assets/images/sequence_snow_icon.png"),
                    const SizedBox(width: 20),
                    HomeScreenGameIcon(
                        argument: Apple,
                        imageLocation: "assets/images/sequence_apple_icon.png"),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
              ],
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
    final iconSize = screenWidth * 0.1; // Adjust the multiplier as needed
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
