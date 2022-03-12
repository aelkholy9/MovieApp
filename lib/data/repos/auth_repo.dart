import 'dart:developer';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/data/services/auth_service.dart';

class AuthenticationRepo {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<Map<String, dynamic>?> login(String userName, String password) async {
    try {
      await _authenticationService.createRequestToken().then((dataMap) {
        final requestToken = dataMap?.data[ApiParameters.requestToken];
        _authenticationService
            .validateLogin(userName, password, requestToken)
            .then((dataMap) {
          return _authenticationService.createSession(requestToken);
        });
      });
    } catch (e) {
      log('error $e');
    }
    return null;
  }
}
