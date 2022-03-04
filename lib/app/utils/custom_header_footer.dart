
import 'package:book_store/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget loadingIndicator() {
  return  CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(primaryPurpleColor),
    strokeWidth: 3,
  );
}

CustomFooter customFooter() {
  return CustomFooter(
    builder: (BuildContext context, LoadStatus? mode) {
      Widget body;

      if (mode == LoadStatus.idle) {
        body = const Text("");
      } else if (mode == LoadStatus.loading) {
        body = loadingIndicator();
      } else if (mode == LoadStatus.failed) {
        body = body = const Text("Loading failed");
      } else if (mode == LoadStatus.canLoading) {
        body = const Text("Release to load more");
      } else {
        body = const Text("");
      }
      return SizedBox(
        height: 50.0,
        child: Center(child: body),
      );
    },
  );
}

CustomHeader customHeader() {
  return CustomHeader(
    builder: (context, mode) {
      return Container(alignment: Alignment.center, color: Colors.transparent, height: 50, child: loadingIndicator());
    },
  );
}
