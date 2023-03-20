import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';
import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

import 'book.dart';

class Record{
  Book book;
  int readId;
  int readPage;
  String review;

  Record({
    required this.book,
    required this.readId,
    required this.readPage,
    required this.review
  });

  Record.nullInit({
    required this.book,
    this.readId = 0,
    this.readPage = 0,
    this.review = "",
  });

  static bool isNull(Record record){
    if(record.book.id == 0){
      return true;
    }
    return false;
  }


  //////////////////////////////////////////////////////////////////////////////[GET] Current Read Records List
  static List<Record> FromJsonCurrentBookList(dynamic json){
    List<Record> newRecordList = <Record>[];
    List<dynamic>.from(Map<String, dynamic>.from(json)["response"]).forEach((element) {
      Map<String, dynamic> e = Map<String, dynamic>.from(element);
      newRecordList.add(
          Record(
            book: Book(
              id: -1,
              title: e["title"],
              author: e["author"],
              publisher: "",
              publishedDate: "",
              page: e["bookPage"],
              cover: e["cover"],
            ),
            readId: e["id"],
            readPage: e["readPage"],
            review: e["text"],
          )
      );
    });
    newRecordList.add(Record.nullInit(book: Book.nullInit()));
    return newRecordList;
  }

  static Future<List<Record>> GETCurrentRecordList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
          Uri.parse("http://" + baseUrl + '/' + URLRecord),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
          }
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return Record.FromJsonCurrentBookList(json.decode(utf8.decode(response.bodyBytes)));
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

    return <Record>[];
  }

  //////////////////////////////////////////////////////////////////////////////[PUT] page modify
  static Future<bool> PUTModifyCurrentBookPage({required int readId, required int newPage}) async {
    ApiResponse apiResponse = ApiResponse();

    print(readId);

    try {
      final response = await http.put(
          Uri.parse("http://$baseUrl/$URLRecord/$readId/$URLPageModify"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
            "Content-Type" : "application/json"
          },
          body: jsonEncode({
            "page" : newPage
          })
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return true;
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

    return false;
  }

  //////////////////////////////////////////////////////////////////////////////[PUT] review modify
  static Future<bool> PUTModifyCurrentReview({required int readId, required String newReview}) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.put(
          Uri.parse("http://$baseUrl/$URLRecord/$readId/$URLReviewModify"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
            "Content-Type" : "application/json"
          },
          body: jsonEncode({
            "text" : newReview
          })
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return true;
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

    return false;
  }

  //////////////////////////////////////////////////////////////////////////////[PUT] finish read
  static Future<bool> PUTFinshRead({required int readId}) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.put(
          Uri.parse("http://$baseUrl/$URLRecord/$readId/$URLFinshRead"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
            "Content-Type" : "application/json"
          },
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return true;
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

    return false;
  }


}