
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:course/Screens/Navi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.network("https://i.imgur.com/zZR7pS9.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: FirebaseAuth.instance.currentUser == null
              ? HomeScreen()
              : Navi(),
        ),
    );
  }
}