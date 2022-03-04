import 'package:book_store/app/models/category_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  List<String> categories = ["FICTION", "PHILOSOPHY", "DRAMA", "HISTORY", "HUMOUR", "ADVENTURE", "POLITICS"];
  List<String> assets = [
    "assets/images/Fiction.svg",
    "assets/images/Philosophy.svg",
    "assets/images/Drama.svg",
    "assets/images/History.svg",
    "assets/images/Humour.svg",
    "assets/images/Adventure.svg",
    "assets/images/Politics.svg"
  ];

  @override
  void onInit() {
    generateCategoryList();
    super.onInit();
  }

  @override
  void onClose() {}

  void generateCategoryList() {
    List<CategoryModel> categoriesList = <CategoryModel>[];
    int i = 0;
    for (var element in categories) {
      CategoryModel category = CategoryModel(categoryName: element, asset: assets[i]);
      categoriesList.add(category);
      i++;
    }
    categoryList.assignAll(categoriesList);
  }
}
