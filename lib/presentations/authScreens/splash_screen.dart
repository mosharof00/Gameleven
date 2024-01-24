import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameleven/presentations/authScreens/onbord_screens.dart';
import 'package:gameleven/utils/const.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(OnbordScreens());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            splashPrimaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // transform: GradientRotation(math.pi /4)
        ),
      ),
      child:
          Center(child: Image.asset('assets/icons/black Logo with name.png')),
    ));
  }
}
