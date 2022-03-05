import 'dart:convert';
import 'package:book_store/app/models/book_model.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static const String baseURL = "http://skunkworks.ignitesol.com:8000/books/";

  static Future<List<BookModel>> fetchBooks(int page, String topic, String searchText) async {
    var url = Uri.parse("$baseURL?page=$page&topic=$topic&search=$searchText&mime_type=image/jpeg");
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> results = jsonDecode(response.body);
      List<BookModel> books = bookModelFromJson(jsonEncode(results['results']));
      return books;
    } else {
      return <BookModel>[];
    }
  }
}
