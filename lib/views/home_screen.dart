// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapps/components/screen_utils.dart';
import 'package:zapps/unused_files/frog.dart';
import 'package:zapps/data/sequence_data.dart';
import '../AppRoutes.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'game_screen_new.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenWidth = ScreenUtil.screenWidth(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/hbg.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenGameIconNew(
                        sequence: sequenceSnow,
                        imageLocation: 'assets/images/sequence_snow_icon.png'),
                    const SizedBox(width: 20),
                    HomeScreenGameIconNew(
                        sequence: sequenceApple,
                        imageLocation: 'assets/images/sequence_apple_icon.png'),
                    const SizedBox(width: 20),
                    HomeScreenGameIconNew(
                        sequence: sequenceFishing,
                        imageLocation:
                            'assets/images/sequence_fishingboy_icon.png'),
                    const SizedBox(width: 20),
                    HomeScreenGameIconNew(
                        sequence: sequenceFootball,
                        imageLocation:
                            'assets/images/sequence_football_icon.png'),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil.screenHeight(context) * 0.03),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenGameIconNew extends StatelessWidget {
  const HomeScreenGameIconNew({
    Key? key,
    required this.sequence,
    required this.imageLocation,
  }) : super(key: key);

  final List<SequenceCardInfo> sequence;

  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate the desired icon size based on screen dimensions
    final iconSize = screenWidth * 0.15; // Adjust the multiplier as needed
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameScreenTest(sequenceList: sequence)));
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

// class HomeScreenGameIcon extends StatelessWidget {
//   const HomeScreenGameIcon({
//     Key? key,
//     required this.argument,
//     required this.imageLocation,
//   }) : super(key: key);
//   final List<Animal> argument;
//   final String imageLocation;
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     // final screenHeight = MediaQuery.of(context).size.height;
//     // Calculate the desired icon size based on screen dimensions
//     final iconSize = screenWidth * 0.15; // Adjust the multiplier as needed
//     return InkWell(
//       onTap: () {
//         Get.toNamed(AppRoutes.gameScreen, arguments: argument);
//       },
//       child: Container(
//         height: iconSize,
//         width: iconSize,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           boxShadow: const [
//             BoxShadow(
//                 color: Colors.black, offset: Offset(0, 5), blurRadius: 10.0)
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(100),
//           child: Image(
//             image: AssetImage(imageLocation),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreenSVGIcon extends StatelessWidget {
//   const HomeScreenSVGIcon({
//     Key? key,
//     required this.argument,
//     required this.imageLocation,
//   }) : super(key: key);
//   final List<Animal> argument;
//   final String imageLocation;
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     // final screenHeight = MediaQuery.of(context).size.height;
//     // Calculate the desired icon size based on screen dimensions
//     final iconSize = screenWidth * 0.15; // Adjust the multiplier as needed
//     return InkWell(
//       onTap: () {
//         Get.toNamed(AppRoutes.gameScreen, arguments: argument);
//       },
//       child: Container(
//         height: iconSize,
//         width: iconSize,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           boxShadow: const [
//             BoxShadow(
//                 color: Colors.black, offset: Offset(0, 5), blurRadius: 10.0)
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(100),
//           child: SvgPicture.asset(
//             imageLocation,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
