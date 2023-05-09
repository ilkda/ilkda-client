import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';
import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/view_model/user_controller.dart';

class Calendar{
  CalendarInfo calendarInfo;
  List<CalendarElement> calendarElements;

  Calendar({
    required this.calendarInfo,
    required this.calendarElements
  });

  Calendar.nullInit({
    required this.calendarInfo,
    this.calendarElements = const []
  });

  bool isNull(){
    return calendarInfo.isNull();
  }

  //////////////////////////////////////////////////////////////////////////////[GET] User Calendar from server
  static Calendar calendarFromJson(CalendarInfo calendarInfo, dynamic json){

    Calendar newCalendar = Calendar(
      calendarInfo: calendarInfo,
      calendarElements: []
    );

    for(int i = 0; i < calendarInfo.thisMonth.day; i++){
      newCalendar.calendarElements.add(CalendarElement.nullInit(level: 0));
    }

    ////Calendar Data
    List<dynamic> response = List<dynamic>.from(Map<String, dynamic>.from(json)["response"]);
    for (var element in response) {
      Map<String, dynamic> e = Map<String, dynamic>.from(element);
      DateTime date = DateTime.parse(e["date"]);
      newCalendar.calendarElements[date.day].readPageCount = e["readPageCount"];
      newCalendar.calendarElements[date.day].level = CalendarElement.calculateLevel(e["readPageCount"], calendarInfo.yearMinReadPageCount, calendarInfo.yearMaxReadPageCount);
    }

    return newCalendar;
  }

  static Future<Calendar> GETUserCalendar({
    required DateTime thisMonth,
  }) async {

    CalendarInfo calendarInfo = await CalendarInfo.GETUserCalendarInfo(thisMonth: thisMonth);
    if(calendarInfo.isNull()) return Calendar.nullInit(
      calendarInfo: CalendarInfo.nullInit(
        thisMonth: calendarInfo.thisMonth
      )
    );

    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
          Uri.parse("http://$baseUrl/$URLRecord/$URLCalendarData?year=${thisMonth.year}&month=${thisMonth.month}"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
          }
      );

      // print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return Calendar.calendarFromJson(calendarInfo, json.decode(utf8.decode(response.bodyBytes)));
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

    return Calendar.nullInit(
      calendarInfo: CalendarInfo.nullInit(
        thisMonth: calendarInfo.thisMonth,
      )
    );
  }
}

class CalendarElement {
  int level;
  int readPageCount;

  CalendarElement({
    required this.level,
    required this.readPageCount
  });

  CalendarElement.nullInit({
    this.level = -1,
    this.readPageCount = 0
  });

  static int calculateLevel(int curCnt, int min, int max){
    if(curCnt == 0)
      return curCnt;
    if(min <= curCnt && curCnt < (max - min) / 2)
      return 1;
    if((max - min) / 2 <= curCnt && curCnt <= max)
      return 2;
    return -1;
  }
}

class CalendarInfo{
  DateTime thisMonth;
  int yearMaxReadPageCount;
  int yearMinReadPageCount;
  int monthReadDateCount;
  int firstWeekdayOfMonth;

  CalendarInfo({
    required this.thisMonth,
    required this.yearMaxReadPageCount,
    required this.yearMinReadPageCount,
    required this.monthReadDateCount,
    this.firstWeekdayOfMonth = -1,
  }){
    firstWeekdayOfMonth = DateTime(thisMonth.year, thisMonth.month, 1).weekday;
  }

  //////////////////////////////////////////////////////////////////////////////[NULL] Calendar Info
  CalendarInfo.nullInit({
    required this.thisMonth,
    this.yearMaxReadPageCount = -1,
    this.yearMinReadPageCount = -1,
    this.monthReadDateCount = -1,
    this.firstWeekdayOfMonth = -1,
  });
  bool isNull(){
    return yearMaxReadPageCount == -1;
  }

  //////////////////////////////////////////////////////////////////////////////[GET] Calendar Info From User
  static CalendarInfo calendarInfoFromJson(
    dynamic json,{
    required DateTime thisMonth,
  }){
    Map<String, dynamic> response = Map<String, dynamic>.from(Map<String, dynamic>.from(json)["response"]);
    return CalendarInfo(
      thisMonth: thisMonth,
      yearMaxReadPageCount: response["yearMaxReadPageCount"],
      yearMinReadPageCount: response["yearMinReadPageCount"],
      monthReadDateCount: response["monthReadDateCount"]
    );
  }

  static Future<CalendarInfo> GETUserCalendarInfo({
    required DateTime thisMonth,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(
          Uri.parse("http://$baseUrl/$URLRecord/$URLCalendarInfo?year=${thisMonth.year}&month=${thisMonth.month}"),
          headers: {
            "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value
          }
      );

      // print(utf8.decode(response.bodyBytes));

      switch (response.statusCode) {
        case 200:
          return CalendarInfo.calendarInfoFromJson(
            thisMonth: thisMonth,
            json.decode(utf8.decode(response.bodyBytes)),
          );
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

    return CalendarInfo.nullInit(
      thisMonth: thisMonth
    );
  }
}