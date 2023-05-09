import 'package:get/get.dart';
import 'package:ilkda_client/model/calendar.dart';

class BookShelfPageViewController extends GetxController {

  //////////////////////////////////////////////////////////////////////////////calendar
  Rx<int> year = 2023.obs;
  Rx<int> month = 3.obs;

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

  bool isCalendarNull(){
    return calendar.value.isNull();
  }

  //////////////////////////////////////////////////////////////////////////////My Records


}