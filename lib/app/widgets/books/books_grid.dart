import 'package:book_store/app/modules/books/controllers/books_controller.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/constants.dart';
import '../../utils/custom_header_footer.dart';
import 'book_card.dart';

class BooksGridBuilderMobile extends GetView<BooksController> {
  const BooksGridBuilderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BooksController());
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        footer: customFooter(),
        header: customHeader(),
        controller: controller.loadMoreController,
        onRefresh: () => controller.pullToReload(),
        onLoading: () => controller.loadMoreBooks(),
        child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, hPadding, hPadding, ScreenUtils.responsiveW(15, context)), vertical: hPadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: responsiveSize(context, 3, 5, 6).toInt(),
                childAspectRatio: responsiveSize(context, 5 / 12, 9 / 16, 9 / 16),
                crossAxisSpacing: responsiveSize(context, 10, 10, 30),
                mainAxisSpacing: 0),
            itemCount: controller.booksList.length,
            itemBuilder: (context, index) {
              return BookCard(book: controller.booksList[index]);
            }),
      ),
    );
  }
}

class BooksGridBuilderWeb extends GetView<BooksController> {
  const BooksGridBuilderWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BooksController());
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: GridView.builder(
                controller: controller.scrollController,
                padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, hPadding, hPadding, ScreenUtils.responsiveW(15, context)), vertical: hPadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: responsiveSize(context, 3, 3, 6).toInt(), childAspectRatio: responsiveSize(context, 1 / 2.25, 1 / 2.25, 9 / 17), crossAxisSpacing: 10, mainAxisSpacing: 0),
                itemCount: controller.booksList.length,
                itemBuilder: (context, index) {
                  return BookCard(book: controller.booksList[index]);
                }),
          ),
          Obx(
            () => SizedBox(
                child:
                    controller.isLoadMore.value ? Container(margin: const EdgeInsets.symmetric(vertical: 10), child: SizedBox(height: 40.0, child: Center(child: loadingIndicator()))) : Container()),
          )
        ],
      ),
    );
  }
}
