import 'package:flutter/cupertino.dart';


class DeviceType extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const DeviceType({Key? key, required this.mobile, required this.tablet, required this.web}) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return mobile;
    } else if (isDesktop(context)) {
      return web;
    } else {
      return tablet;
    }
  }
}
