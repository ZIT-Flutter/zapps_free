// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapps/components/constants.dart';

import 'package:zapps/components/screen_utils.dart';
import 'package:zapps/data/sequence_data.dart';

import '../AppRoutes.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = ScreenUtil.screenWidth(context);
    screenHeight = ScreenUtil.screenHeight(context);

    print('Screen Width: $screenWidth');
    print('Screen Height: $screenHeight');
    return Scaffold(
      body: Container(
        height: ScreenUtil.screenHeight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth * 0.06,
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingsScreen);
                      },
                      child: Image.asset(
                        'assets/icons/settings_icon_128.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
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
                          imageLocation:
                              'assets/images/sequence_snow_icon.png'),
                      const SizedBox(width: 20),
                      HomeScreenGameIconNew(
                          sequence: sequenceApple,
                          imageLocation:
                              'assets/images/sequence_apple_icon.png'),
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
                  SizedBox(height: screenHeight * 0.15),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    decoration: BoxDecoration(
                      color: ColorPallate.blue,
                      // border: Border.all(color: ColorPallate.yellow, width: 3),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                        child: Text(
                      "Select a sequence card",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.025,
                          color: ColorPallate.white),
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
