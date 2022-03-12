import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/data/services/auth_service.dart';
import 'package:movie_app/utils/storage.dart';

class AuthenticationRepo {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<Map<String, dynamic>?> login(String userName, String password) async {
    try {
      final requestToken = await getRequestToken();
      if (requestToken.isNotEmpty) {
        final loginCredentialsStatus =
            await validateLogin(userName, password, requestToken);
        final successResponse = loginCredentialsStatus['success'];
        if (successResponse) {
          String session = await getSessionId(requestToken);
          LocalStorage.put(ApiParameters.sessionId, session);
        }
        return loginCredentialsStatus;
      }
    } catch (e) {
      log('error $e');
    }
    return null;
  }

  Future<String> getRequestToken() async {
    final dataMap = await _authenticationService.createRequestToken();
    return dataMap?.data[ApiParameters.requestToken];
  }

  Future<Map<String, dynamic>> validateLogin(
      String userName, String password, String requestToken) async {
    final dataMap = await _authenticationService.validateLogin(
        userName, password, requestToken);
    return dataMap?.data;
  }

  Future<String> getSessionId(String requestToken) async {
    final dataMap = await _authenticationService.createSession(requestToken);
    return dataMap?.data[ApiParameters.sessionId];
  }
}
