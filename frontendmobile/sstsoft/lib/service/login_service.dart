import 'dart:convert';

import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/request/recovery_password_model.dart';
import 'package:sstsoft/model/request/schedule_model.dart';
import 'package:sstsoft/model/request/user_model.dart';
import 'package:sstsoft/model/response/auth_token_response.dart';
import 'package:sstsoft/model/response/password_status_response.dart';
import 'package:sstsoft/util/httpclient.dart';
import 'package:sstsoft/util/sharedpreferences.dart';

class LoginService {
  final HttpClient client = new HttpClient();
  final SharedPreferencesUtil prefs = new SharedPreferencesUtil();

  static final tokenPreferences = "token";
  static final userPreferences = "user";
  static final journeyStarted = "journeyStarted";
  static final journeySchedule = "journeySchedule";

  LoginService() {
    client.setBaseUrl(ServiceCons.BASE_URL);
  }

  Future<void> loginUser(UserModel user) async {
    try {
      dynamic response =
          await client.fetchPost(ServiceCons.LOGIN, user.toJson());
      AuthTokenResponse token = AuthTokenResponse.fromJson(response);
      await prefs.setString(tokenPreferences, token.key);
      await prefs.setString(userPreferences, user.username);
      await prefs.setBool(journeyStarted, false);
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<void> logoutUser() async {
    try {
      await prefs.deleteValue(tokenPreferences);
      await prefs.deleteValue(userPreferences);
      await prefs.deleteValue(journeyStarted);
      await prefs.deleteValue(journeySchedule);
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<RecoveryPasswordStatusResponse> recoveryUserPassword(
      RecoveryPasswordModel recoveryPasswordModel) async {
    try {
      dynamic response = await client.fetchPost(
          ServiceCons.RESET_PASSWORD, recoveryPasswordModel.toJson());
      RecoveryPasswordStatusResponse passwordStatus =
          RecoveryPasswordStatusResponse.fromJson(response);
      return passwordStatus;
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<bool> userSessionAvailable() async {
    try {
      String token = await prefs.getString(tokenPreferences);
      return token != null && token.isNotEmpty;
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<bool> returnIfUserJourneyIsStarted() async {
    try {
      bool isJourneyStarted = await prefs.getBool(journeyStarted);
      return journeyStarted == null ? false : isJourneyStarted;
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<void> setIfUserJourneyIsStarted(bool finished) async {
    try {
      await prefs.setBool(journeyStarted, finished);
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<void> startJourney() async {
    await setIfUserJourneyIsStarted(true);
  }

  Future<void> finishJourney() async {
    await setIfUserJourneyIsStarted(false);
  }

  Future<void> registerJourneySchedule(ScheduleModel schedule) async {
    await prefs.setString(journeySchedule, jsonEncode(schedule.toJson()));
  }

  Future<ScheduleModel> returnRegisteredJourneySchedule() async {
    try {
      return ScheduleModel.fromJson(
          jsonDecode(await prefs.getString(journeySchedule)));
    } catch (ex, stacktrace) {
      print(ex);
      throw ex;
    }
  }

  Future<void> deleteJourneySchedule() async {
    await prefs.deleteValue(journeySchedule);
  }
}
