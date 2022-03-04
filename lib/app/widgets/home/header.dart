import 'package:book_store/app/modules/home/controllers/home_controller.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';

class HeaderItem extends GetView<HomeController> {
  final double margin;
  final double titleSize;
  final double subtitleSize;
  final String title;

  const HeaderItem({Key? key, required this.margin, required this.titleSize, required this.subtitleSize, required this.title}) : super(key: key);

  Widget _background(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/Pattern.svg",
      fit: BoxFit.cover,
      height: responsiveSize(context,ScreenUtils.responsiveH(35, context), ScreenUtils.responsiveH(35, context), ScreenUtils.responsiveH(25, context)),
      width: ScreenUtils.responsiveW(100, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      height: responsiveSize(context, ScreenUtils.responsiveH(35, context), ScreenUtils.responsiveH(35, context), ScreenUtils.responsiveH(25, context)),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          _background(context),
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: margin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: montseratSemiBold.copyWith(fontSize: titleSize, color: primaryPurpleColor),
                ),
                SizedBox(
                  height: ScreenUtils.responsiveH(2, context),
                ),
                Text(
                  "A social cataloging website that allows you to freely search its database of books, annotations, and reviews.",
                  style: montseratSemiBold.copyWith(fontSize: subtitleSize, color: lightBlackColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileHeader extends StatelessWidget {
  const MobileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderItem(margin: hPadding, titleSize: ScreenUtils.responsiveFS(24, context), subtitleSize: ScreenUtils.responsiveFS(11, context), title: "Gutenberg\nProject");
  }
}

class TabletHeader extends StatelessWidget {
  const TabletHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderItem(margin: hPadding, titleSize: ScreenUtils.responsiveFS(16, context), subtitleSize: ScreenUtils.responsiveFS(7, context), title: "Gutenberg\nProject");
  }
}


class WebHeader extends StatelessWidget {
  const WebHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  HeaderItem(margin: ScreenUtils.responsiveW(15, context), titleSize: ScreenUtils.responsiveFS(6, context), subtitleSize: ScreenUtils.responsiveFS(3, context), title: "Gutenberg Project");
  }
}
