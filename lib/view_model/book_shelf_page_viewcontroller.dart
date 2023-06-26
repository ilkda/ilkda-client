import 'package:get/get.dart';
import 'package:ilkda_client/model/calendar.dart';
import 'package:ilkda_client/model/record.dart';

class BookShelfPageViewController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    updateCalendar(DateTime(DateTime.now().year, DateTime.now().month + 1, 0));
    updateMyRecordList();
  }

  //////////////////////////////////////////////////////////////////////////////calendar

  Rx<Calendar> calendar = Calendar.nullInit(
      calendarInfo: CalendarInfo.nullInit(
        thisMonth: DateTime(
          DateTime.now().year,
          DateTime.now().month + 1,
          0
        ),
      )
  ).obs;

  void updateCalendar(DateTime targetDateTime) async {
    calendar(await Calendar.GETUserCalendar(thisMonth: targetDateTime));
    calendar.refresh();
  }

  void updateCalendarWithPrevMonth() async {
    calendar.value.calendarInfo.thisMonth = DateTime(
        calendar.value.calendarInfo.thisMonth.year,
        calendar.value.calendarInfo.thisMonth.month,
        0
    );
    updateCalendar(calendar.value.calendarInfo.thisMonth);
    calendar.refresh();
  }

  void updateCalendarWithNextMonth() async {
    calendar.value.calendarInfo.thisMonth = DateTime(
        calendar.value.calendarInfo.thisMonth.year,
        calendar.value.calendarInfo.thisMonth.month + 2,
        0
    );
    updateCalendar(calendar.value.calendarInfo.thisMonth);
    calendar.refresh();
  }

  bool isCalendarNull(){
    return calendar.value.isNull();
  }

  //////////////////////////////////////////////////////////////////////////////My Records
  RxList<Record> myRecordList = <Record>[].obs;

  void updateMyRecordList() async {
    myRecordList(await Record.GETFinishedRecordList());
  }

}