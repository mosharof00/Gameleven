// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gameleven/utils/const.dart';

class UiHelper {
  static customTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHind,
  ) {
    return TextField(
      controller: controller,
      obscureText: toHind,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: Icon(
          iconData,
          color: const Color.fromARGB(255, 184, 184, 184),
        ),
        fillColor: Color(0xffF0F0F0),
      ),
    );
  }

  static customButton(VoidCallback voidCallback, String text) {
    return InkWell(
      onTap: () {
        voidCallback();
      },
      child: Container(
        height: 50,
        color: primaryColor,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  static customAlartBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        });
  }

  static textFormFild() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: "phone Number",
          prefixIcon: Icon(Icons.phone),
          isDense: true,
          fillColor: Color(0xffF0F0F0),
          filled: true,
          border: InputBorder.none,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primaryColor))),
    );
  }
}

class OnbordContent extends StatelessWidget {
  const OnbordContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 40,
          ),
          Text(title,
              style: const TextStyle(fontSize: 25, color: primaryColor)),
          const SizedBox(
            height: 15,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
