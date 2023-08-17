// @dart=2.12.0

// ignore_for_file: invalid_language_version_override, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zapps/views/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

import 'AppRoutes.dart';
//adfho

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(
      DevicePreview(
        enabled: Platform.isWindows,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zapps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: AppRoutes.homeSceen,
      home: SplashScreen(),
      // home: GameScreenTest(sequenceList: sequence_1),

      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
