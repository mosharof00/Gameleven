import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  flashBarMessage(BuildContext context, String message) {
    Flushbar(
      //title:  "Hey Ninja",
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
