import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/utils/scroll_behaviour.dart';

void setAppBar() {
  // set transparent appBar
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setAppBar();
  await Future.delayed(const Duration(milliseconds: 100));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: const HomeView(),
    );
  }
}
