import 'package:flutter/material.dart';

class AppSize {
  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;

  static double height10(context) => height(context) * .010;
  static double height15(context) => height(context) * .015;
  static double height20(context) => height(context) * .020;
  static double height25(context) => height(context) * .025;
  static double height30(context) => height(context) * .030;
  static double height40(context) => height(context) * .040;
  static double height80(context) => height(context) * .08;
  static double height100(context) => height(context) * .1;
  static double height150(context) => height(context) * .15;
  static double height200(context) => height(context) * .2;

  static double width10(context) => width(context) * .010;
  static double width15(context) => width(context) * .015;
  static double width20(context) => width(context) * .020;
  static double width25(context) => width(context) * .025;
  static double width30(context) => width(context) * .030;
  static double width40(context) => width(context) * .040;
}

const blueColor = Colors.blue;

const mediumText =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
const largeText = TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
const smallText =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey);