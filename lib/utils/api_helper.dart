import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/api.dart';

class ApiHelper {
  late final Dio dio;
  ApiHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: 60 * 1000,
        connectTimeout: 60 * 1000,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  Future<Response?> get(String url,
      [queryParameter = const {'api_key': ApiConstants.apiKey}]) async {
    Response? response;
    try {
      response = await dio.get(url, queryParameters: queryParameter);
      log("request Token: ${response.data}");
      return response;
    } catch (error) {
      log('error: $error');
      return response;
    }
  }
  //
  // Future<Response?> getWithCustomParameters(String url, Map<String, dynamic>) async {
  //   Response? response;
  //   try {
  //     response =
  //     await dio.get(url, queryParameters: {'api_key': ApiConstants.apiKey});
  //     log("request Token: ${response.data}");
  //     return response;
  //   } catch (error) {
  //     log('error: $error');
  //     return response;
  //   }
  // }

  Future<Response?> post(String url, Map<String, dynamic> body) async {
    Response? response;
    print(body);
    try {
      response = await dio.post(
        url,
        queryParameters: {'api_key': ApiConstants.apiKey},
        data: jsonEncode(body),
      );
      log("request Token: ${response.data}");
      return response;
    } catch (error) {
      log('error: $error');
      return response;
    }
  }
}
