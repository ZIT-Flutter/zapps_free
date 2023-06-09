import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:zapps/views/home_screen.dart';
import 'package:zapps/views/main_game_screen.dart';
import 'package:zapps/views/more_screen.dart';
import 'package:zapps/views/scores_screen.dart';
import 'package:zapps/views/setting_screen.dart';
import 'package:zapps/views/splash_screen.dart';

class AppRoutes {
  static const String homeSceen = "/homescreen";
  static const String moreScreen = "/morescreen";
  static const String settingsScreen = "/settingscreen";
  static const String scoreScreen = "/scoresscreen";
  static const String splashScreen = "/splashscreen";
  static const String gameScreen = "/gameScreen";

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () => SplashScreen(),
        transitionDuration: const Duration(milliseconds: 1000),
        transition: Transition.fade),
    GetPage(
        name: homeSceen,
        page: () => HomeScreen(),
        transitionDuration: const Duration(milliseconds: 1000),
        transition: Transition.fade),
    GetPage(
        name: scoreScreen,
        page: () => const ScoresScreen(),
        transitionDuration: const Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: settingsScreen,
        page: () => SettingScreen(),
        transitionDuration: const Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: moreScreen,
        page: () => MoreScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        transition: Transition.downToUp),
    GetPage(
      name: gameScreen,
      page: () => const GameScreen(),
      transitionDuration: const Duration(milliseconds: 1000),
      transition: Transition.native,
    ),
  ];
}
