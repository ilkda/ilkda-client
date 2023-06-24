import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';
import 'package:ilkda_client/view_model/user_controller.dart';
import 'ilkda_user.dart';

class Club{
  String name;
  List<IlkdaUser> clubMembers;

  Club({
    required this.name,
    required this.clubMembers,
  });

  Club.nullInit({
    this.name = "",
    required this.clubMembers,
  });

  //////////////////////////////////////////////////////////////////////////////register club

  static Future<bool> registerClub(Club club) async {
    int clubId = await POSTRegisterClub(club.name);
    if(clubId == -1) {
      return false;
    }

    if(await POSTAddMember(clubId, club.clubMembers) != 200) {
      return false;
    }
    return true;
  }

  //////////////////////////////////////////////////////////////////////////////[POST] RegisterClub : returns clubId
  static Future<int> POSTRegisterClub(String name) async {
    final response = await http.post(
        Uri.parse("http://$baseUrl/$URLClub"),
        headers: {
          "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name
        })
    );

    print(response.body);

    switch(response.statusCode){
      case 200:
        return Map<String, dynamic>.from(json.decode(response.body))["response"];
      default:
        break;
    }

    return -1;
  }

  //////////////////////////////////////////////////////////////////////////////[POST] AddMember : returns statuscode
  static Future<int> POSTAddMember(int clubId, List<IlkdaUser> clubMembers) async {
    final response = await http.post(
        Uri.parse("http://$baseUrl/$URLClub/$URLAddMembers"),
        headers: {
          "Authorization" : "Bearer " + Get.find<UserController>().accessToken.value,
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "clubId" : clubId,
          // "members" : clubMembers.map((e) => e.name).toList()
        })
    );

    print(response.body);

    return response.statusCode;
  }

}