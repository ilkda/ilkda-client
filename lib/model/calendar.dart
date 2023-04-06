import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';
import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class Calendar{
  CalendarInfo calendarInfo;
  List<List<CalendarElement>> calendarElements;

  Calendar({
    required this.calendarInfo,
    required this.calendarElements
  });

  Calendar.nullInit({
    required this.calendarInfo,
    this.calendarElements = const []
  });

  //////////////////////////////////////////////////////////////////////////////[GET] User Calendar from server
  static Calendar calendarFromJson(CalendarInfo calendarInfo, int year, int month, dynamic json){
    Calendar newCalendar = Calendar(
      calendarInfo: calendarInfo,
      calendarElements: []
    );

    List<dynamic> records = List<dynamic>.from(Map<String, dynamic>.from(json)["response"]);

    DateTime thisMonth = DateTime.parse("$year-$month-01");
    int thisMonthDays = DateTime(thisMonth.year, thisMonth.month + 1, 0).day;
    ////Calendar Init
    newCalendar.calendarElements.add([]);
    for(int i = 0; i < (thisMonth.weekday % 7); i++){
      newCalendar.calendarElements[0].add(CalendarElement(
        date: "${year}-${month}-${i + 1}",
        level: 0,
        readPageCount: 0
      ));
    }
    for(int i = 0; i < thisMonthDays; i++){
      if(i % 7 == 0) newCalendar.calendarElements.add([]);
      newCalendar.calendarElements.last.add(CalendarElement.nullInit());
    }

    ////Calendar Data
    List<dynamic> response = List<dynamic>.from(Map<String, dynamic>.from(json)["response"]);
    response.forEach((element) {
      Map<String, dynamic> e = Map<String, dynamic>.from(element);
      DateTime date = DateTime.parse(e["date"]);
      newCalendar.calendarElements[((date.day + thisMonth.weekday & 7) / 7) as int][date.weekday % 7] = CalendarElement(
        date: e["date"],
        level: 0,
        readPageCount: e["readPageCount"]
      );
    });

    return Calendar.nullInit(calendarInfo: CalendarInfo.nullInit());
  }

  static Future<Calendar> GETUserCalendar({
    required int year,
    required int month,
  }) async {

    CalendarInfo calendarInfo = await CalendarInfo.GETUserCalendarInfo(year: year, month: month);
    if(calendarInfo.isNull()) return Calendar.nullInit(calendarInfo: CalendarInfo.nullInit());

    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
          Uri.parse("http://$baseUrl/$URLRecord/$URLCalendarData?year=${year}&month=${month}"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
          }
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return Calendar.calendarFromJson(calendarInfo, year, month, json.decode(utf8.decode(response.bodyBytes)));
          // return Calendar.CalendarFromJson(json.decode(utf8.decode(response.bodyBytes)));
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

    return Calendar.nullInit(calendarInfo: CalendarInfo.nullInit());
  }
}

class CalendarElement {
  String date;
  int level;
  int readPageCount;

  CalendarElement({
    required this.date,
    required this.level,
    required this.readPageCount
  });

  CalendarElement.nullInit({
    this.date = "",
    this.level = 0,
    this.readPageCount = 0
  });
}

class CalendarInfo{
  int yearMaxReadPageCount;
  int yearMinReadPageCount;
  int monthReadDateCount;

  CalendarInfo({
    required this.yearMaxReadPageCount,
    required this.yearMinReadPageCount,
    required this.monthReadDateCount
  });

  //////////////////////////////////////////////////////////////////////////////[NULL] Calendar Info
  CalendarInfo.nullInit({
    this.yearMaxReadPageCount = -1,
    this.yearMinReadPageCount = -1,
    this.monthReadDateCount = -1
  });
  bool isNull(){
    return yearMaxReadPageCount == -1;
  }

  //////////////////////////////////////////////////////////////////////////////[GET]

  //////////////////////////////////////////////////////////////////////////////[GET] Calendar Info From User
  static CalendarInfo calendarInfoFromJson(dynamic json){
    Map<String, dynamic> response = Map<String, dynamic>.from(json)["response"];
    return CalendarInfo(
      yearMaxReadPageCount: response["yearMaxReadPageCount"],
      yearMinReadPageCount: response["yearMinReadPageCount"],
      monthReadDateCount: response["monthReadDateCount"]
    );
  }

  static Future<CalendarInfo> GETUserCalendarInfo({
    required int year,
    required int month,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
          Uri.parse("http://$baseUrl/$URLRecord/$URLCalendarInfo?year=${year}&month=${month}"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
          }
      );

      print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return CalendarInfo.calendarInfoFromJson(json.decode(utf8.decode(response.bodyBytes)));
      // return Calendar.CalendarFromJson(json.decode(utf8.decode(response.bodyBytes)));
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

    return CalendarInfo.nullInit();
  }
}