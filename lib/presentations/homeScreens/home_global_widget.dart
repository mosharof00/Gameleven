import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = const Color(0xffD81D4C);
  static Color fadedText = const Color(0xff646464);
  static Color kingBlackText = const Color(0xff2F2F2F);
  static Color brown = const Color(0xff72142C);
  static Color backgroundColor = const Color(0xffF3F3F3);
  static Color searchBarColor = const Color(0xffE8E8E8);
  static Color searchBarTextColor = const Color(0xffAFAFAF);
  static Color cardTextColor = const Color(0xff434343);
  static Color ratingBlue = const Color(0xff021E65);

  // List<Color> customColor =[];
}

class SpaceInHeight extends StatelessWidget {
  final double height;
  const SpaceInHeight({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceInWidth extends StatelessWidget {
  final double width;
  const SpaceInWidth({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class TextRegular extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize, height;
  const TextRegular(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: 'RobotoRegular',
        fontSize: fontSize,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize, height;
  const TextMedium(
      {super.key,
      required this.text,
      this.color,
      required this.fontSize,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'RobotoMedium',
          fontSize: fontSize,
          height: height),
    );
  }
}

class CartIcon extends StatelessWidget {
  final Color color, iconColor;
  const CartIcon({super.key, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.3, 5.6, 3.7, 4.4),
      height: 26,
      width: 26,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Image.asset(
        'assets/icons/cart.png',
        color: iconColor,
      ),
    );
  }
}
