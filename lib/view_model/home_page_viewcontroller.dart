import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:ilkda_client/model/aladin_book.dart';
import 'package:ilkda_client/model/book.dart';
import 'package:ilkda_client/model/record.dart';

class HomePageViewController extends GetxController{

  //////////////////////////////////////////////////////////////////////////////home page
  //Current Record Lists
  RxList<Record> currentRecordList = <Record>[Record.nullInit(book: Book.nullInit())].obs;
  // RxList<Record> currentRecordList = <Record>[
  //   Record(
  //     book: Book(
  //       id: 1,
  //       title: "",
  //       author: '',
  //       publisher: '',
  //       publishedDate: '',
  //       page: 300,
  //       cover: "https://image.yes24.com/goods/102347474/XL",
  //     ),
  //     readId: 0,
  //     readPage: 120,
  //     review: "",
  //   ),
  //   // Record.nullInit(book: Book.nullInit()),
  // ].obs;

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
    currentRecordIndex(0);
  }

  //Current Book Record Index
  RxInt currentRecordIndex = 0.obs;

  void increaseRecordIndex(){
    if(currentRecordIndex.value < currentRecordList.length - 1){
      currentRecordIndex(currentRecordIndex.value + 1);
      updateCurrentBookRecord(currentRecordList[currentRecordIndex.value]);
    }
  }

  void decreaseRecordIndex(){
    if(currentRecordIndex.value > 0){
      currentRecordIndex(currentRecordIndex.value - 1);
      updateCurrentBookRecord(currentRecordList[currentRecordIndex.value]);
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

  RxBool ifSearchResultEmpty = false.obs;
  void updateIfSearchResultEmpty(bool newIfSearchResultEmpty){
    ifSearchResultEmpty(newIfSearchResultEmpty);
  }

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
    if(searchBooksList.isEmpty){
      updateIfSearchResultEmpty(true);
    }
    else{
      updateIfSearchResultEmpty(false);
    }
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
    updateBookReportText(newRecord.review);
    return true;
  }

  //page modify dialog text field controller
  TextEditingController pageModifyTextEditingController = TextEditingController();

  Future<int> updateCurrentRecordPage() async{
    int statusCode =  await Record.PUTModifyCurrentBookPage(readId: currentBookRecord.value.readId, newPage: int.parse(pageModifyTextEditingController.text));
    if(statusCode == 200){
      currentBookRecord.value.readPage = int.parse(pageModifyTextEditingController.text);
      currentBookRecord.refresh();
    }
    return statusCode;
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
  RxString bookReportText = ("").obs;
  FocusNode bookReportFocusNode = FocusNode();
  TextEditingController bookReportController = TextEditingController();
  RxBool ifReadMode = true.obs;

  void toReadMode(){
    ifReadMode(true);
  }
  void toWriteMode(){
    ifReadMode(false);
  }

  void updateBookReportText(String newBookReportText){
      bookReportText(newBookReportText);
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

  void rollBackBookReview(){
    bookReportText.value = currentBookRecord.value.review;
    bookReportController.text = bookReportText.value;
  }



}