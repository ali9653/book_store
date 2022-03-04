import 'package:book_store/app/modules/books/controllers/books_controller.dart';
import 'package:book_store/app/utils/colors.dart';
import 'package:book_store/app/utils/fonts.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/book_model.dart';

class BookCard extends GetView<BooksController> {
  final Books book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  static double width(BuildContext context) => responsiveSize(context, ScreenUtils.responsiveW(33, context), ScreenUtils.responsiveW(33, context), 140);

  Widget _imagePlaceholder (BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        shape: BoxShape.rectangle,

      ),
      height: responsiveSize(context, ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(30, context)),
      width: width(context),
    );
  }

  Widget _bookImageItem(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.openBook(book),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            placeholder: (context, url) => _imagePlaceholder(context),
            imageUrl: book.formats!.imageJpeg!,
            fit: BoxFit.cover,
            height: responsiveSize(context, ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(22.5, context), ScreenUtils.responsiveH(30, context)),
            width: width(context),
          )),
    );
  }

  Widget _bookTitle(BuildContext context) {
    return SizedBox(
      width: width(context),
      child: Text(
        book.title!.toUpperCase(),
        style: montseratRegular.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: lightBlackColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _bookAuthor(BuildContext context) {
    String? title = "";
    title = book.authors!.isNotEmpty ? book.authors![0].name : "";
    return SizedBox(
      width: width(context),
      child: Text(
        title!,
        style: montseratRegular.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: darkGreyColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BooksController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _bookImageItem(context),
        SizedBox(
          height: ScreenUtils.responsiveH(1.5, context),
        ),
        _bookTitle(context),
        SizedBox(
          height: ScreenUtils.responsiveH(1, context),
        ),
        _bookAuthor(context)
      ],
    );
  }
}
