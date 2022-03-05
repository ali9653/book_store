import 'package:book_store/app/models/book_model.dart';
import 'package:book_store/app/modules/books/controllers/books_controller.dart';
import 'package:book_store/app/utils/constants.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class BookInfoItem extends GetView<BooksController> {
  final BookModel book;

  const BookInfoItem({Key? key, required this.book}) : super(key: key);

  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      alignment: Alignment.centerRight,
      width: ScreenUtils.responsiveW(100, context),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: IconButton(
          splashRadius: 10,
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.clear_circled_solid,
            size: 32,
            color: Colors.grey.shade800,
          )),
    );
  }

  Widget _imageCard() {
    return IntrinsicHeight(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: book.formats!.imageJpeg!,
            fit: BoxFit.cover,
            width: 140,
            height: 200,
          )),
    );
  }

  Widget _bookTitle() {
    return Text(
      book.title!.toUpperCase(),
      style: montseratRegular.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: lightBlackColor),
    );
  }

  Widget _bookAuthor() {
    String? title = "";
    title = book.authors!.isNotEmpty ? book.authors![0].name : "";
    return Text(
      title!,
      style: montseratRegular.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: darkGreyColor),
    );
  }

  Widget _readButton(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.openBook(book),
      child: Container(
        height: 50,
        width: responsiveSize(context, ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(50, context), ScreenUtils.responsiveW(30, context)) - 200,
        decoration: BoxDecoration(
          color: primaryPurpleColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Text(
            "Read",
            style: montseratSemiBold.copyWith(fontSize: responsiveSize(context, 16, 16, 15), color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BooksController());
    return SizedBox(
      width: responsiveSize(context, ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(50, context), ScreenUtils.responsiveW(30, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(context),
          Container(
            constraints: const BoxConstraints(maxHeight: 250),

            padding: EdgeInsets.all(hPadding),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _imageCard(),
                  SizedBox(
                    width: hPadding,
                  ),
                  IntrinsicHeight(
                    child: SizedBox(
                      width: responsiveSize(context, ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(50, context), ScreenUtils.responsiveW(30, context)) - 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _bookTitle(),
                              const SizedBox(
                                height: 10,
                              ),
                              _bookAuthor(),
                            ],
                          ),
                          _readButton(context)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
