import 'package:book_store/app/models/book_model.dart';
import 'package:book_store/app/services/books_api.dart';
import 'package:book_store/app/widgets/books/error_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RefreshController loadMoreController = RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  var isLoading = false.obs;
  var isLoadMore = false.obs;
  int page = 1;
  var booksList = <Books>[].obs;
  var searchText = "".obs;
  var topic = "";

  @override
  void onInit() {
    if (kIsWeb) {
      scrollController.addListener(scrollListener);
    }
    debounceSearch(topic);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchController.dispose();
  }

  // fetch all the books that have images
  Future<void> getBooks(String topic) async {
    page = 1;
    isLoading.value = true;
    var books = await BooksApi.fetchBooks(page, topic.toLowerCase(), searchText.value);
    booksList.assignAll(books);
    isLoading.value = false;
  }

  // load more books while scrolling
  void loadMoreBooks() async {
    page++;
    var books = await BooksApi.fetchBooks(page, topic.toLowerCase(), searchText.value);
    booksList.addAll(books);
    if (kIsWeb) {
      isLoadMore.value = false;
    } else {
      loadMoreController.loadComplete();
    }
  }

  // pull to refresh books (mobile)
  void pullToReload() async {
    page = 1;
    var books = await BooksApi.fetchBooks(page, topic.toLowerCase(), searchText.value);
    booksList.assignAll(books);
    loadMoreController.refreshCompleted();
  }

  // delayed search to prevent multiple api calls
  void debounceSearch(String topic) {
    debounce(searchText, (_) {
      getBooks(topic);
    }, time: const Duration(milliseconds: 500));
  }

  void setTopic(String topic) {
    topic = topic;
  }

  // clear searched value
  void clearSearchValue() {
    if (searchText.value.trim().isNotEmpty) {
      searchController.clear();
      searchText.value = "";
    } else {
      null;
    }
  }

  // load more books (web)
  void scrollListener() {
    if (scrollController.position.extentAfter == 0 && isLoadMore.value == false) {
      loadMoreBooks();
      isLoadMore.value = true;
    }
  }

  // open book
  void openBook(Books book) {
    bool foundTextVersion = false;
    bool foundHtmlVersion = false;
    List<String> textVersions = [book.formats!.textPlain!, book.formats!.textPlainCharsetIso88591!, book.formats!.textPlainCharsetUtf8!, book.formats!.textPlainCharsetUsAscii!];
    List<String> htmlVersions = [book.formats!.textHtml!, book.formats!.textHtmlCharsetIso88591!, book.formats!.textHtmlCharsetUtf8!, book.formats!.textHtmlCharsetUsAscii!];

    // check html version
    for (var element in htmlVersions) {
      if (element.isNotEmpty) {
        launchURL(element);
        foundHtmlVersion = true;
        break;
      }
    }

    // check text version if html version not found
    if (!foundHtmlVersion) {
      for (var element in textVersions) {
        if (element.isNotEmpty) {
          launchURL(element);
          foundTextVersion = true;
          break;
        }
      }
    }

    // show error dialog if no readable version found
    if (!foundHtmlVersion && !foundTextVersion) {
      openErrorDialog();
    }
  }


  // launch book URL
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void openErrorDialog() {
    Get.dialog(const ErrorDialog());
  }
}
