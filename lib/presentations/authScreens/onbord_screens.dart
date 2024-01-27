import 'package:flutter/material.dart';
import 'package:gameleven/presentations/authScreens/auth_ui_helper.dart';
import 'package:gameleven/presentations/authScreens/signIn_screen.dart';
import 'package:gameleven/utils/const.dart';
// import 'package:get/get.dart';

class OnbordScreens extends StatefulWidget {
  const OnbordScreens({
    super.key,
  });

  @override
  State<OnbordScreens> createState() => _OnbordScreensState();
}

class _OnbordScreensState extends State<OnbordScreens> {
  late PageController _pageController;
  int _pageIndex = 0;

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
                  itemCount: demo_data.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnbordContent(
                      image: demo_data[index].image,
                      title: demo_data[index].title,
                      description: demo_data[index].description))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  demo_data.length,
                  (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 4,
                      ),
                      child: DotIndicator(isActive: index == _pageIndex))),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  if (_pageIndex == 2) {
                  
                     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  } else {
                    _pageController.nextPage(
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 300),
                    );
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
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 13 : 5,
      width: 5,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : primaryColor.withOpacity(0.4),
        // borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  Onbord({required this.image, required this.title, required this.description});
}

final List<Onbord> demo_data = [
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
