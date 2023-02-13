import 'package:get/get.dart';
import 'package:ilkda_client/servicies/kakao_login/kakao_oauth_login.dart';
import 'package:ilkda_client/servicies/kakao_login/kakao_oauth_token_from_local_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class UserController extends GetxController{

  //Kakao LogIn
  RxString kakaoToken = "".obs;

  Future<bool> ifKakaoTokenInLocalStorage() async {
    String? token = await getKakaoOauthTokenFromLocalStorage();

    if(token == null){
      return false;
    }
    else{
      kakaoToken(token);
      return true;
    }
  }

  Future<bool> tryKakaoLogin() async {
    OAuthToken? token = await kakaoLogin();
    if(token == null){
      return false;
    }
    else{
      writeKakaoOauthTokenToLocalStorage(token.accessToken);
      kakaoToken(token.accessToken);
      return true;
    }
  }

}