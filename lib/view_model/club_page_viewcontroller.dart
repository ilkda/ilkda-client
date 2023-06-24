import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilkda_client/model/club.dart';
import 'package:ilkda_client/model/ilkda_user.dart';

class ClubPageViewController extends GetxController{

  ////club registeration page

  Rx<Club> club = Club.nullInit(clubMembers: []).obs;

  void addClubMember(IlkdaUser user){
    club.value.clubMembers.add(user);
    club.refresh();
  }

  //textController
  TextEditingController clubNameController = TextEditingController();
  TextEditingController clubMemberController = TextEditingController();

  void addClubMemberFromTextController(){
    //validation
    if(clubMemberController.text == ""){
      return;
    }

    addClubMember(IlkdaUser(name: clubMemberController.text, email: "test@google.com"));
  }

  void removeClubMember(IlkdaUser user){
    club.value.clubMembers.removeAt(club.value.clubMembers.indexOf(user));
    club.refresh();
  }

  void clearClubMemberController(){
    clubMemberController.clear();
  }

  void registerClub(){
    Club.registerClub(club.value);
  }

}