import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _key = "kakaoOauthToken";

Future<String?> getKakaoOauthTokenFromLocalStorage() async {
  final storage = FlutterSecureStorage();
  return await storage.read(key: _key);
}

void writeKakaoOauthTokenToLocalStorage(String token) async{
  final storage = FlutterSecureStorage();
  storage.write(key: _key, value: token);
}