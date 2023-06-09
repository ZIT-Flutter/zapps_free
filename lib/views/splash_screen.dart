import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zapps/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  // final spinkit = const SpinKitSquareCircle(
  //   color: Colors.white,
  //   size: 50.0,
  // );

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const SpinKitCubeGrid(
              color: Colors.greenAccent,
              size: 130.0,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Zapps',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }
}



            // SplashScreenView(
            //   text: 'Zapps',
            //   navigateRoute: HomeScreen(),
            //   duration: 500000,
            //   imageSize: 130,
            //   imageSrc: "assets/images/sequence_snow_1.png",
            //   backgroundColor: Colors.white,
            // ),