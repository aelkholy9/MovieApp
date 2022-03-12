import 'dart:io';

class ApiConstants {
  static const String apiKey = "31521ab741626851b73c684539c33b5a";
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String requestTokenUrl = 'authentication/token/new';
  static const String validateTokenUrl =
      'authentication/token/validate_with_login';
  static const String createSessionUrl = 'authentication/session/new';
  static const String imagesUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlayingMoviesUrl = 'movie/now_playing';

  static const String getUserBySessionUrl = 'account';
  static String getWatchListUrl(int userId) {
    return getUserBySessionUrl + '/$userId/' + '/watchlist/movies';
  }

  static String addToWatchListUrl(int userId) {
    return getUserBySessionUrl + '/$userId/' + '/watchlist';
  }

  static Map<String, dynamic> constructParametersWithPageNumber(
      int pageNumber) {
    return {
      ApiParameters.apiKey: ApiConstants.apiKey,
      ApiParameters.page: pageNumber,
    };
  }

  static const plainHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  };
  static Map<String, String> headersWithApiKey() => {
        HttpHeaders.authorizationHeader: 'Basic $apiKey',
      };
}

class ApiParameters {
  static const userName = 'username';
  static const password = 'password';
  static const requestToken = 'request_token';
  static const sessionId = 'session_id';
  static const statusMsg = 'status_message';
  static const success = 'success';
  static const apiKey = 'api_key';
  static const page = 'page';
}
