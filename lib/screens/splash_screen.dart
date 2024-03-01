import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:wizarding_world_explorer/screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/splash_screen_wand.png',
      ),
      logoWidth: MediaQuery.of(context).size.width * 0.50,
      title: const Text(
        "Wizarding World Explorer",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Proxima-Nova',
          fontSize: 48,
          color: Colors.white,
        ),
      ),
      backgroundImage: const AssetImage('assets/images/splash_screen_bg.png'),
      showLoader: false,
      navigator: const MainPage(),
      durationInSeconds: 5,
    );
  }
}
