import 'package:get/get.dart';
import 'package:ilkda_client/model/servicies/kakao_oauth_token_from_local_storage.dart';

class UserController extends GetxController{

  //Kakao OAuth Token
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
}