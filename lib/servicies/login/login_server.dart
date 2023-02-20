
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ilkda_client/constants/key.dart';

import 'package:ilkda_client/servicies/api.dart';
import 'package:ilkda_client/servicies/login/get_refresh_token_from_local_storage.dart';

////try to login with server
//if success, return accessToken, and store refreshToken in local storage
Future<String> POSTtryServerSignUP(String kakaoAccessToken) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('http://${baseUrl}/${signUpURL}'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "kakaoToken": kakaoAccessToken
      })
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> responseObj = Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["response"];
        writeRefreshOauthTokenToLocalStorage(responseObj["refreshToken"]);
        // print("access Token : ${responseObj["accessToken"]}");
        return responseObj["accessToken"];
      case 401:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.apiError = ApiError(error: "Server error. Please retry");
  }

  return "";
}

////try to login with server
//if success, return accessToken, and store refreshToken in local storage
Future<String> POSTtryServerSignin(String ilkdaRefreshToken) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
        Uri.parse('http://${baseUrl}/${signInURL}'),
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
      case 401:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.apiError = ApiError(error: "Server error. Please retry");
  }

  return "";
}