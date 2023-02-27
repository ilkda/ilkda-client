import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/book.dart';

class HomePageViewController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    searchAladinBooks();
  }

  //////////////////////////////////////////////////////////////////////////////home page
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


  //////////////////////////////////////////////////////////////////////////////search page
  TextEditingController searchController = TextEditingController();

  RxList<Book> searchBooksList = <Book>[].obs;

  void updateSearchBooksList(List<Book> newBooks){
    searchBooksList(newBooks);
  }

  void searchBookList() async {
    updateSearchBooksList(
      await Book
      .GETSearchBookList(
        title: searchController.text,
      )
    );
  }

  void registerBook(int bookID) async {
    await Book
      .POSTReisterBook(
        id: bookID,
      );
  }

}