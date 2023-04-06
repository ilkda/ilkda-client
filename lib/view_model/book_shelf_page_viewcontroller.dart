import 'package:get/get.dart';
import 'package:ilkda_client/model/calendar.dart';

class BookShelfPageViewController extends GetxController {

  //////////////////////////////////////////////////////////////////////////////calendar
  Rx<int> year = 2023.obs;
  Rx<int> month = 3.obs;

  Rx<Calendar> calendar = Calendar.nullInit(calendarInfo: CalendarInfo.nullInit()).obs;

  void updateCalendar() async {
    calendar(await Calendar.GETUserCalendar(year: year.value, month: month.value));
  }

  // RxList<List<int>> calendar = [
  //   [ 1,  0,  2,  1,  1,  2,  0],
  //   [ 1,  0,  2,  1,  2,  0,  1],
  //   [ 1,  1,  1,  2,  0,  2,  0],
  //   [ 0,  2,  1,  0,  2,  0,  0],
  // ].obs;

  // RxList<List<int>> calendar = [
  //   [-1, -1, -1, -1, -1,  2,  0],
  //   [ 1,  0,  2,  1,  2,  0,  1],
  //   [ 1,  1,  1,  2,  0,  2,  0],
  //   [ 1,  1,  1,  2,  0,  2,  0],
  //   [ 0,  2,  1,  0, -1, -1, -1],
  // ].obs;\\

  // RxList<List<int>> calendar = [
  //   [-1, -1, -1, -1, -1,  0,  0],
  //   [ 0,  0,  0,  0,  0,  0,  0],
  //   [ 0,  0,  0,  0,  0,  0,  0],
  //   [ 0,  0,  0,  0,  0,  0,  0],
  //   [ 0,  0,  0,  0, -1, -1, -1],
  // ].obs;


  // RxList<List<int>> calendar = [
  //   [-1, -1, -1, -1, -1,  2,  0],
  //   [ 1,  0,  2,  1,  2,  0,  1],
  //   [ 1,  1,  1,  2,  0,  2,  0],
  //   [ 1,  1,  1,  2,  0,  2,  0],
  //   [ 1,  0,  2,  1,  2,  0,  1],
  //   [ 0, -1, -1, -1 , -1, -1, -1],
  // ].obs;


  //////////////////////////////////////////////////////////////////////////////My Records


}