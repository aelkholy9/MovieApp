import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/utils/api_helper.dart';

class AuthenticationService {
  ApiHelper apiHelper = ApiHelper();

  Future<Response?> createRequestToken() async {
    try {
      return await apiHelper.get(ApiConstants.requestTokenUrl);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }

  Future<Response?> validateLogin(
      String userName, String password, String requestToken) async {
    try {
      final body = {
        ApiParameters.userName: userName,
        ApiParameters.password: password,
        ApiParameters.requestToken: requestToken
      };
      return await apiHelper.post(ApiConstants.validateTokenUrl, body);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }

  Future<Response?> createSession(String requestToken) async {
    try {
      final body = {ApiParameters.requestToken: requestToken};
      return await apiHelper.post(ApiConstants.createSessionUrl, body);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }

  Future<Response?> getUserBySession(String sessionId) async {
    try {
      final queryParameters = {
        ApiParameters.apiKey: ApiConstants.apiKey,
        ApiParameters.sessionId: sessionId,
      };
      return await apiHelper.get(
          ApiConstants.getUserBySessionUrl, queryParameters);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }
}
