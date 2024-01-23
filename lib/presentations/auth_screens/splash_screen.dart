import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameleven/utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 3), () {
  //     MaterialPageRoute(builder: (context) => );
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD81D4C).withOpacity(0.6)],
          stops: [0.1],
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
