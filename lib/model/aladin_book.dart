import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ilkda_client/constants/key.dart';
import 'package:ilkda_client/servicies/api.dart';

class AladinBook{
  String title;
  String cover;
  int itemId;

  AladinBook({
    required this.title,
    required this.cover,
    required this.itemId,
  });

  static List<AladinBook> AladinBookListFromJSON(dynamic json){
    List<AladinBook> newBook = <AladinBook>[];
    List<dynamic>.from(Map<String, dynamic>.from(json)["item"]).forEach((element) {
      Map<String, dynamic> e = Map<String, dynamic>.from(element);
      newBook.add(AladinBook(
        title: e["title"],
        cover: e["cover"],
        itemId: e["itemId"] as int
      ));
    });

    return newBook;
  }

  static Future<List<AladinBook>> GETAladinRecommendBooks({
    int MaxResults = 10,
    int start = 1,
    String SearchTarget = "Book",
    String Version = "20131101",
    String QueryType = "ItemNewSpecial"
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
        Uri.parse('http://www.aladin.co.kr/ttb/api/ItemList.aspx?MaxResults=${MaxResults}&start=${start}&SearchTarget=${SearchTarget}&Version=${Version}&ttbkey=$aladinTTBKey&QueryType=$QueryType&output=js'),
      );

      switch (response.statusCode) {
        case 200:
          // print(response.body);
          return AladinBook.AladinBookListFromJSON(json.decode(response.body));
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

    return <AladinBook>[];
  }

}