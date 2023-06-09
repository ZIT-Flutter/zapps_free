// @dart=2.12.0

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zapps/views/splash_screen.dart';

import 'AppRoutes.dart';
//adfho

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
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

      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
