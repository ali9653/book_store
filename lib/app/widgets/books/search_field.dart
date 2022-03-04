import 'package:book_store/app/modules/books/controllers/books_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/fonts.dart';
import '../../utils/screen_utils.dart';

class BookSearchField extends GetView<BooksController> {
  const BookSearchField({Key? key}) : super(key: key);

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      constraints: const BoxConstraints(),
      border: InputBorder.none,
      suffixIconConstraints: const BoxConstraints(),
      prefixIconConstraints: const BoxConstraints(),
      contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: primaryPurpleColor, width: 1),
      ),
      enabledBorder: InputBorder.none,
      prefixIcon: _prefixIcon(context),
      suffixIcon: _suffixIcon(context),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: "Search",
      hintStyle: montseratRegular.copyWith(fontSize: 15, color: darkGreyColor, fontWeight: FontWeight.bold),
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          CupertinoIcons.search,
          color: darkGreyColor,
          size: responsiveSize(context,22, 22, 22),
        ));
  }

  Widget _suffixIcon(BuildContext context) {
    return Obx(
      () => IconButton(
        splashRadius: 5,
              onPressed: () => controller.clearSearchValue(),
              icon: Icon(
                Icons.close,
                size: responsiveSize(context,25, 25, 22),
                color: controller.searchText.value.trim().isEmpty ? Colors.transparent : darkGreyColor,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BooksController());
    return Container(
      // height: 50,
      margin: EdgeInsets.symmetric(horizontal: responsiveSize(context,hPadding, hPadding, 0)),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        shape: BoxShape.rectangle,
        color: lightGreyColor,
      ),
      child: TextFormField(
          onChanged: (val) => controller.searchText.value = val,
          maxLines: 1,
          cursorColor: primaryPurpleColor,
          controller: controller.searchController,
          style: montseratRegular.copyWith(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          decoration: inputDecoration(context)),
    );
  }
}
