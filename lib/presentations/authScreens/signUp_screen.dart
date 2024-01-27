import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/presentations/authScreens/auth_ui_helper.dart';
import 'package:gameleven/presentations/cart/product_list.dart';
// import 'package:gameleven/presentations/homeScreens/home_screen.dart';
import 'package:gameleven/utils/const.dart';
// import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  // String varificationId;
  SignUpScreen({
    super.key,
    //  required this.varificationId
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailCuntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.customAlartBox(context, 'Enter Requrired Fields');
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProductList()));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.customAlartBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: deepPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset('assets/icons/black Logo with name.png'),
            const SizedBox(
              height: 40,
            ),
            UiHelper.customTextField(
                emailCuntroller, "Enter Your email", Icons.phone, false),
            const SizedBox(
              height: 15,
            ),
            UiHelper.customTextField(
                passwordController, "Password", Icons.password, true),
            const SizedBox(
              height: 15,
            ),
            UiHelper.customButton(() {
              signUp(emailCuntroller.text.toString(),
                  passwordController.text.toString());
            }, 'Sign up')
            // InkWell(
            //   onTap: () async {
            //     try {
            //       PhoneAuthCredential credential =
            //           await PhoneAuthProvider.credential(
            //               verificationId: widget.varificationId,
            //               smsCode: otpController.text.toString());
            //       FirebaseAuth.instance
            //           .signInWithCredential(credential)
            //           .then((value) {
            //         Get.offAll(HomeScreen());
            //       });
            //     } catch (ex) {}
            //   },
            //   child: Container(
            //     height: 50,
            //     color: primaryColor,
            //     child: Center(
            //       child: Text(
            //         "Verify",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
