
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
      body: {
        "kakaoToken": kakaoAccessToken
      }
    );

    switch (response.statusCode) {
      case 200:
        writeRefreshOauthTokenToLocalStorage(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["refreshToken"]);
        return Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["accessToken"];
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
Future<String> GETtryServerSignin(String ilkdaRefreshToken) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('http://${baseUrl}/${signInURL}?'),
      body: {
        "refreshToken": ilkdaRefreshToken
      }
    );

    switch (response.statusCode) {
      case 200:
        writeRefreshOauthTokenToLocalStorage(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["refreshToken"]);
        return Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["accessToken"];
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