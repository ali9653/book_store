import 'package:flutter/cupertino.dart';

class ScreenUtils {

  // responsive height
  static double responsiveH(double i, BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return h * i / 100;
  }

  // responsive width
  static double responsiveW(double i, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return w * i / 100;
  }

  // responsive fontSize
  static double responsiveFS(double i, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return w / 100 * (i / 3);
  }
}

double responsiveSize(BuildContext context, double mobile, double tablet, double web) {
  double w = MediaQuery.of(context).size.width;
  if (w >= 1200) {
    return web;
  } else if (w >= 700) {
    return tablet;
  } else {
    return mobile;
  }
}
