
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';

import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/servicies/login/get_refresh_token_from_local_storage.dart';

////try to login with server
//if success, return accessToken, and store refreshToken in local storage
Future<String> POSTtryServerSignUP(String kakaoAccessToken) async {
  try {
    print(kakaoAccessToken);

    final response = await http.post(
      Uri.parse('http://${baseUrl}/${URLsignUp}'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "kakaoToken": kakaoAccessToken
      })
    );

    print(response.body);

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> responseObj = Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["response"];
        writeRefreshOauthTokenToLocalStorage(responseObj["refreshToken"]);
        // print("access Token : ${responseObj["accessToken"]}");
        return responseObj["accessToken"];
      default:
        print("Error at POSTtryServerSignin");
        print("[${response.statusCode}]");
        print(response.body);
        break;
    }
  } on SocketException {
    print("No Internet connection");
  }

  return "";
}

////try to login with server
//if success, return accessToken, and store refreshToken in local storage
Future<String> POSTtryServerSignin(String ilkdaRefreshToken) async {
  try {
    final response = await http.post(
        Uri.parse('http://${baseUrl}/${URLsignIn}'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "refreshToken": ilkdaRefreshToken
        })
    );

    // print(response.body);

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> responseObj = Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["response"];
        writeRefreshOauthTokenToLocalStorage(responseObj["refreshToken"]);
        // print("access Token : ${responseObj["accessToken"]}");
        return responseObj["accessToken"];

      default:
        print("Error at POSTtryServerSignin");
        print("[${response.statusCode}]");
        print(response.body);
        break;
    }
  } on SocketException {
    print("No Internet connection");
  }

  return "";
}