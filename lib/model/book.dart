import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';

import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class Book{
  int id;
  String title;
  String author;
  String publisher;
  String publishedDate;
  int page;
  String cover;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.publishedDate,
    required this.page,
    required this.cover,
  });

  //////////////////////////////////////////////////////////////////////////////Search Book List
  static List<Book> SearchBooksJson(dynamic json){
    List<Book> newBooks = <Book>[];
    List<dynamic>.from(Map<String, dynamic>.from(json)["response"]).forEach((element) {
      Map<String, dynamic> e = Map<String, dynamic>.from(element);
      newBooks.add(
        Book(
          id: e["id"],
          title: e["title"],
          author: e["author"],
          publisher: "publisher",
          publishedDate: "publishedDate",
          page: e["page"],
          cover: e["cover"]
        )
      );
    });

    return newBooks;
  }

  static Future<List<Book>> GETSearchBookList({
    String title = "",
    int page = 0,
    int size = 10
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
        Uri.parse("http://" + baseUrl + '/' + URLbookListSearch + '?' + "title=${title}&page=${page}&size=${size}"),
        headers: {
          "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
        }
      );

      print(response.body);

      switch (response.statusCode) {
        case 200:
          return Book.SearchBooksJson(json.decode(utf8.decode(response.bodyBytes)));
        case 401:
          apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
          break;
        default:
          apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
          break;
      }
    } on SocketException {
      apiResponse.apiError = ApiError(error: "Server error. Please retry");
    }

    return <Book>[];
  }

  //////////////////////////////////////////////////////////////////////////////register Book on Read List
  static Future<String> RegisterBookJson(dynamic json){
    return Map<String, dynamic>.from(json)["response"];
  }

  static Future<String> POSTReisterBook({required int id}) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.post(
        Uri.parse("http://" + baseUrl + '/' + URLregisterBook),
        headers: {
          "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "BookId": id
        })
      );

      print(response.body);

      switch (response.statusCode) {
        case 200:
          return Book.RegisterBookJson(json.decode(utf8.decode(response.bodyBytes)));
        default:
          apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
          return response.statusCode.toString();
      }
    } on SocketException {
      apiResponse.apiError = ApiError(error: "Server error. Please retry");
    }

    return "failed!";
  }


}