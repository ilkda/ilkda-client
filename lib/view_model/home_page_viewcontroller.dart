import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_open_api.dart';

class HomePageViewController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    searchAladinBooks();
  }

  //Aladin Recommended BookLists
  RxList<AladinBook> aladinBooks = <AladinBook>[].obs;
  void updateAladinBooks(List<AladinBook> newAladinBooks) {
    aladinBooks(newAladinBooks);
  }

  void searchAladinBooks(){
    AladinBook
      .GETAladinRecommendBooks()
      .then((value) {
        updateAladinBooks(value);
      });
  }
}