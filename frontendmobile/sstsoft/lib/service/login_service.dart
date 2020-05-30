import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/request/user_model.dart';
import 'package:sstsoft/model/response/auth_token_response.dart';
import 'package:sstsoft/util/httpclient.dart';
import 'package:sstsoft/util/sharedpreferences.dart';

class LoginService{
  final HttpClient client = new HttpClient();
  final SharedPreferencesUtil prefs = new SharedPreferencesUtil();

  static final tokenPreferences = "token";
  static final userPreferences = "user";

  LoginService(){
    client.setBaseUrl(ServiceCons.BASE_URL);
  }

  Future<void> loginUser(UserModel user) async {
    try{
      dynamic response = await client.fetchPost(ServiceCons.LOGIN, user.toJson());
      AuthTokenResponse token = AuthTokenResponse.fromJson(response);
      await prefs.setString(tokenPreferences, token.key);
      await prefs.setString(userPreferences, user.username);
    }catch(ex, stacktrace){
      print(stacktrace);
      throw ex;
    }
  }

  Future<bool> userSessionAvailable() async {
    try{
      String token = await prefs.getString(tokenPreferences);
      return token != null && token.isNotEmpty;
    }catch(ex, stacktrace){
      print(stacktrace);
      throw ex;
    }
  }

}