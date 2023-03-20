import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/model/record.dart';

class HomePageViewController extends GetxController{

  //////////////////////////////////////////////////////////////////////////////home page
  //Current Record Lists
  RxList<Record> currentRecordList = <Record>[Record.nullInit(book: Book.nullInit())].obs;

  void updateCurrentRecordList(List<Record> newRecordList) {
    currentRecordList(newRecordList);
    if(currentRecordList.isNotEmpty){
      currentBookRecord(currentRecordList[0]);
    }
  }

  void searchCurrentRecordList() async {
    updateCurrentRecordList(
      await Record
      .GETCurrentRecordList()
    );
  }

  //Current Book Record Index
  RxInt currentRecordIndex = 0.obs;

  void increaseRecordIndex(){
    if(currentRecordIndex.value < currentRecordList.length - 1){
      currentRecordIndex(currentRecordIndex.value + 1);
    }
  }

  void decreaseRecordIndex(){
    if(currentRecordIndex.value > 0){
      currentRecordIndex(currentRecordIndex.value - 1);
    }
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

  Future<int> registerBook(int bookID) async {
    return await Book
      .POSTReisterBook(
        id: bookID,
      );
  }


  //////////////////////////////////////////////////////////////////////////////read book page
  Rx<Record> currentBookRecord = Record.nullInit(book: Book.nullInit()).obs;
  // Rx<Record> currentBookRecord = Record(
  //   book: Book(
  //     id: 0,
  //     title: "",
  //     author : "",
  //     publisher : "",
  //     publishedDate : "",
  //     page : 0,
  //     cover : "",
  //   ),
  //   readPage: 0,
  // ).obs;

  bool updateCurrentBookRecord(Record newRecord){
    currentBookRecord(newRecord);
    return true;
  }

  //page modify dialog text field controller
  TextEditingController pageModifyTextEditingController = TextEditingController();

  Future<bool> updateCurrentRecordPage() async{
    bool ifSuccessed =  await Record.PUTModifyCurrentBookPage(readId: currentBookRecord.value.readId, newPage: int.parse(pageModifyTextEditingController.text));
    if(ifSuccessed){
      currentBookRecord.value.readPage = int.parse(pageModifyTextEditingController.text);
      currentBookRecord.refresh();
      return true;
    }
    else{
      return false;
    }
  }

  //finish read
  Future<bool> finishCurrentBook() async{
    bool ifSuccessed = await Record.PUTFinshRead(readId: currentBookRecord.value.readId);
    if(ifSuccessed){
      return true;
    }
    else{
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////book report page
  RxString bookReportText = (" " * 187).obs;
  FocusNode bookReportFocusNode = FocusNode();
  RxBool ifReadMode = true.obs;
  void changeMode(){
    if(ifReadMode.value){
      ifReadMode(false);
    }
    else{
      ifReadMode(true);
    }
  }

  void updateBookReportText(String newBookReportText){
    if(newBookReportText.length <= 187){
      bookReportText(newBookReportText + ' ' * (187 - newBookReportText.length));
    }
    else if(newBookReportText.length % 11 == 0){
      bookReportText(newBookReportText);
    }
    else {
      bookReportText(newBookReportText + ' ' * (11 - newBookReportText.length % 11));
    }
  }

  Future<bool> saveBookReview() async{
    bool ifSuccessed = await Record.PUTModifyCurrentReview(readId: currentBookRecord.value.readId, newReview: bookReportText.value);
    if(ifSuccessed){
      currentBookRecord.value.review = bookReportText.value;
      return true;
    }
    else{
      return false;
    }
  }



}