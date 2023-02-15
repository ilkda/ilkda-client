import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ilkda_client/constants/key.dart';

Future<String?> getRefreshTokenFromLocalStorage() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: refreshTokenKey);
}

void writeRefreshOauthTokenToLocalStorage(String token) async {
  const storage = FlutterSecureStorage();
  storage.write(key: refreshTokenKey, value: token);
}