import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gameleven/presentations/authScreens/auth_ui_helper.dart';
import 'package:gameleven/presentations/authScreens/signUp_screen.dart';
import 'package:gameleven/presentations/cart/product_list.dart';
// import 'package:gameleven/presentations/homeScreens/home_screen.dart';
import 'package:gameleven/utils/const.dart';
// import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCuntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  logIn(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.customAlartBox(context, 'Enter Requrired Fields');
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
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
          centerTitle: true,
          title: const Text(
            "Sign In",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: deepPrimaryColor),
      body: SingleChildScrollView(
        child: Padding(
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
                height: 20,
              ),
              UiHelper.customButton(() async {
                logIn(emailCuntroller.text.toString(),
                    passwordController.text.toString());
                // for Phone Authentication
                // await FirebaseAuth.instance.verifyPhoneNumber(
                //     verificationCompleted:
                //         (PhoneAuthCredential phoneAuthCredential) {},
                //     verificationFailed: (FirebaseAuthException ex) {},
                //     codeSent: (String verificationId, int? resendtoken) {
                //       Get.to(OTPScreen(
                //         varificationId: verificationId,
                //       ));
                //     },
                //     codeAutoRetrievalTimeout: (String verificationId) {},
                //     phoneNumber: phoneCuntroller.text.toString());
              }, "Sign in"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(fontSize: 17)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(fontSize: 19, color: primaryColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
