
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';

void navigateTo(context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigateWithoutComeBack(context, Widget screen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

Widget defaultButton(
    {double width = double.infinity,
    Color backgroundColor = Colors.blueAccent,
    bool isUpperCase = true,
    double radius = 3,
    required void Function() function,
    required String text}) {
  return Container(
    width: width,
    height: 50,
    child: MaterialButton(
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: function,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: backgroundColor),
  );
}

void showToast(
    {required ToastStates state, required message}) {
  Toast.show(
    message,
    gravity: Toast.bottom,
    backgroundColor: chooseToastColor(state),
    textStyle: const TextStyle(fontSize: 25),
    duration: 2

  );
}

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.amber;
  }
}

Widget LogOutButton(context){
  return defaultButton(function: (){
      CacheHelper.sharedPreferences.remove('uid').then((value) {
        navigateWithoutComeBack(context, LoginScreen());
      });
  }, text: 'خروج',width: 80,backgroundColor: Colors.red.withOpacity(0.7),radius: 3);}
