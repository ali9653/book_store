import 'package:book_store/app/utils/colors.dart';
import 'package:book_store/app/utils/fonts.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: responsiveSize(context, ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(25, context)),
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.red.shade500,
                  size: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "OOPS!",
                  style: montseratSemiBold.copyWith(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No viewable version available",
              style: montseratRegular.copyWith(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    minimumSize: const Size(0, 0),
                    alignment: Alignment.center),
                onPressed: () => Get.back(),
                child: Text(
                  "OK",
                  style: montseratSemiBold.copyWith(fontSize: 15, color: primaryPurpleColor),
                )),
          ],
        ),
      ),
    );
  }
}
