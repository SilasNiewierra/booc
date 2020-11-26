import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void createToast(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Theme.of(context).primaryColor,
      textColor: Colors.white,
      fontSize: 20.0);
}
