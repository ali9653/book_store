import 'package:book_store/app/utils/colors.dart';
import 'package:book_store/app/utils/device_type.dart';
import 'package:book_store/app/utils/fonts.dart';
import 'package:book_store/app/utils/screen_utils.dart';
import 'package:book_store/app/widgets/books/books_grid.dart';
import 'package:book_store/app/widgets/books/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/books/placeholder.dart';
import '../controllers/books_controller.dart';

class BooksView extends StatefulWidget {
  final String topic;
  const BooksView({Key? key, required this.topic}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  BooksController controller = Get.put(BooksController());

  Widget _title() {
    return Text(
      widget.topic,
      style: montseratSemiBold.copyWith(fontSize: 24, color: primaryPurpleColor),
    );
  }

  Widget _webHeader() {
    return Container(
      height: ScreenUtils.responsiveH(30, context),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtils.responsiveW(15, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: primaryPurpleColor,
                  )),
              const SizedBox(
                width: 5,
              ),
              Container(padding: const EdgeInsets.only(top: 5), child: _title()),
            ],
          ),
          SizedBox(
            height: ScreenUtils.responsiveH(2, context),
          ),
          const BookSearchField(),
          SizedBox(
            height: ScreenUtils.responsiveH(2, context),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    controller.setTopic(widget.topic);
    controller.getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryScaffoldColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(responsiveSize(context,140, 140, 0)),
        child: AppBar(
          iconTheme: IconThemeData(color: primaryPurpleColor, size: 30),
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: _title(),
          centerTitle: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Column(
                children: const [
                  BookSearchField(),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
        ),
      ),
      body: Column(
        children: [
          DeviceType(mobile: Container(), tablet: Container(), web: _webHeader()),
          Expanded(
            child: Obx(
              () => SizedBox(
                  child: controller.isLoading.value
                      ? const GridPlaceHolder()
                      : SizedBox(
                          child: controller.booksList.isEmpty
                              ? Center(
                                  child: Text(
                                  "No results found",
                                  style: montseratRegular.copyWith(fontSize: 16),
                                ))
                              : const DeviceType(mobile: BooksGridBuilderMobile(), tablet: BooksGridBuilderMobile(), web: BooksGridBuilderWeb()),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
