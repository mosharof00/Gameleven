import 'package:flutter/material.dart';
import 'package:gameleven/presentations/authScreens/auth_ui_helper.dart';
import 'package:gameleven/presentations/homeScreens/home_screen.dart';
import 'package:gameleven/utils/const.dart';
import 'package:get/get.dart';

class OnbordScreens extends StatefulWidget {
  const OnbordScreens({
    super.key,
  });

  @override
  State<OnbordScreens> createState() => _OnbordScreensState();
}

class _OnbordScreensState extends State<OnbordScreens> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: demu_data.length,
                  itemBuilder: (context, index) => OnbordContent(
                      image: demu_data[index].image,
                      title: demu_data[index].title,
                      description: demu_data[index].description))),
          ...List.generate(
              demu_data.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: DotIndicator(isActive: index == 1))),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  if (_pageController.initialPage == 3) {
                    Get.offAll(HomeScreen());
                  } else {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                width: 25,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      )),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 15 : 5,
      width: 5,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(12)),
    );
  }
}

class Onbord {
  final String image, title, description;
  Onbord({required this.image, required this.title, required this.description});
}

final List<Onbord> demu_data = [
  Onbord(
      image: 'assets/images/66fef2332cebef40c02d550ee1b9b20B.png',
      title: 'Gaming Collection',
      description: onbordDescription),
  Onbord(
      image: 'assets/images/9270745e7575c04418d3717bd8fb0819A.png',
      title: 'Home Decerotation',
      description: onbordDescription),
  Onbord(
      image: 'assets/images/42c1d2e1b261e376763edfdeb70b6b3C.png',
      title: 'G11 Gaming zone',
      description: onbordDescription)
];
