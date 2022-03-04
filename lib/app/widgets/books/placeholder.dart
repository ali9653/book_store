import 'package:book_store/app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../utils/constants.dart';
import '../../utils/screen_utils.dart';
import 'book_card.dart';

class BookPlaceHolder extends StatelessWidget {
  const BookPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: responsiveSize(context, 5/10, 5/10, 5/8),
      child: SkeletonAnimation(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: primaryPurpleColor.withOpacity(0.1),
              ),
              width: BookCard.width(context),
              height: responsiveSize(context,ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(30, context)),
            ),
            SizedBox(height: ScreenUtils.responsiveH(1, context),),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
                color: primaryPurpleColor.withOpacity(0.1),
              ),
              width: BookCard.width(context),
              height: responsiveSize(context,ScreenUtils.responsiveH(2.5, context),ScreenUtils.responsiveH(2.5, context), ScreenUtils.responsiveH(2, context)),
            ),
          ],
        ),
      ),
    );
  }
}


class GridPlaceHolder extends StatelessWidget {
  const GridPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: responsiveSize(context,hPadding, hPadding, ScreenUtils.responsiveW(15, context)), vertical: hPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: responsiveSize(context,3, 3, 6).toInt(), childAspectRatio: responsiveSize(context,1 / 2.25, 1 / 2.25, 9 / 17), crossAxisSpacing: 10, mainAxisSpacing: 0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const BookPlaceHolder();
        });
  }
}

