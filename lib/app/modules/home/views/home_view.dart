import 'package:book_store/app/utils/colors.dart';
import 'package:book_store/app/utils/constants.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:book_store/app/widgets/home/categoy_card.dart';
import 'package:book_store/app/utils/device_type.dart';
import 'package:book_store/app/widgets/home/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget _categoryListItemMobile() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: controller.categoryList[index]);
        });
  }

  Widget _categoryGridItemWeb(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtils.responsiveW(15, context) - hPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 16 / 2.5, crossAxisSpacing: 20, mainAxisSpacing: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: controller.categoryList[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: primaryScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DeviceType(mobile: MobileHeader(), tablet: TabletHeader(), web: WebHeader()),
            DeviceType(
              mobile: Container(),
              tablet: Container(),
              web: SizedBox(
                height: ScreenUtils.responsiveH(5, context),
              ),
            ),
            DeviceType(mobile: _categoryListItemMobile(), tablet: _categoryListItemMobile(), web: _categoryGridItemWeb(context))
          ],
        ),
      ),
    );
  }
}
