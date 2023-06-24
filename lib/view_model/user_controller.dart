import 'package:get/get.dart';
import 'package:ilkda_client/model/ilkda_user.dart';
import 'package:ilkda_client/servicies/login/login_kakao_oauth.dart';
import 'package:ilkda_client/servicies/login/get_refresh_token_from_local_storage.dart';
import 'package:ilkda_client/servicies/login/login_server.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class UserController extends GetxController{

  //////////////////////////////////////////////////////////////////////////////Log in & Authorization
  RxString accessToken = "".obs;

  //// try auto sign in
  // check if there is a refresh token in local storage
  Future<bool> tryAutoSignIn() async {
    String? refreshToken = await getRefreshTokenFromLocalStorage();

    if(refreshToken == null){
      return false;
    }
    else{
      return trySignin(refreshToken);
    }
  }

  ////try to signin with kakao
  //and if success, try to login with server
  //and if finally success, return true
  Future<bool> tryKakaoLogin() async {
    OAuthToken? token = await kakaoLogin();
    print(token!.accessToken);

    if(await trySignUp(token) == false){
      return false;
    }

    return true;
  }

  ////try to signUp with server
  //if success, keep the accessToken
  Future<bool> trySignUp(OAuthToken token) async{
    String accessToken = await POSTtryServerSignUP(token.accessToken);
    if(accessToken == ""){
      return false;
    }

    this.accessToken(accessToken);
    return true;
  }

  ////try to signin with server
  //if success, keep the accessToken
  Future<bool> trySignin(String ilkdaRefreshToken) async{
    String accessToken = await POSTtryServerSignin(ilkdaRefreshToken);
    if(accessToken == ""){
      return false;
    }

    this.accessToken(accessToken);
    return true;
  }

  //////////////////////////////////////////////////////////////////////////////IlkdaUser
  IlkdaUser ilkdaUser = IlkdaUser(
    name: "ayang",
    email: ""
  );

}