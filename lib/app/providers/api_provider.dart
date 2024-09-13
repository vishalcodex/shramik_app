import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../models/api_response.dart';
import '../providers/api_client.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/auth_service.dart';
import 'api_endpoints.dart';

class ApiProvider extends GetxService with ApiClient {
  late dio.Dio _httpClient;
  late AuthService authService;

  ApiProvider() {
    authService = Get.find<AuthService>();
    this.baseUrl = Urls.baseUrl;
    _httpClient = new dio.Dio();
  }

  Future<ApiProvider> init() async {
    _httpClient.options.baseUrl = this.baseUrl!;
    _httpClient.options.connectTimeout = 60 * 1000;
    return this;
  }

  void forceRefresh({Duration duration = const Duration(minutes: 10)}) {
    if (!foundation.kDebugMode) {}
  }

  void unForceRefresh({Duration duration = const Duration(minutes: 10)}) {
    if (!foundation.kDebugMode) {
      // _optionsCache = buildCacheOptions(duration, forceRefresh: false);
    }
  }

  Future<String> uploadFile(File file) async {
    dio.FormData data = dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromFile(file.path, filename: file.path)
    });

    return await Get.find<ApiProvider>()
        .makeAPICall("POST", "upload", data)
        .then((value) {
      return value.data["filename"];
    });
  }

  Future<ApiResponse> getOTPLessUser(String waID) async {
    String client_id = "5f02sso2";
    String client_secret = "giekc535x6ghzkrh";

    dio.Dio client = dio.Dio();
    client.options.baseUrl = "https://innovizia.authlink.me";
    client.options.headers.addAll({
      "clientId": client_id,
      "clientSecret": client_secret,
      "Content-Type": "application/json",
    });
    var result = await client.post("", data: {"waId": waID});

    var response = jsonDecode(result.data);
    if (response["statusCode"] == 200) {
      return ApiResponse.completed(response["user"]);
    } else {
      return ApiResponse.error(response["error"], Error.DATA_FETCH_ERROR);
    }
  }

  Future<ApiResponse> makeAPICall(method, endpoint, data) async {
    var url = Uri.parse(Urls.getApiUrl(endpoint));
    var token = authService.token ?? "";
    _httpClient.options.headers.addAll({"Authorization": "Bearer $token"});

    try {
      var result;
      if (kDebugMode) {
        print(url);
      }
      switch (method) {
        case "GET":
          result = await _httpClient.get(url.path);
          break;
        case "POST":
          result = await _httpClient.post(url.path, data: data);
          break;
        case "PUT":
          result = await _httpClient.put(url.path, data: data);
          break;
        case "DELETE":
          result = await _httpClient.delete(url.path, data: data);
          break;
        default:
          return ApiResponse.error("Invalid Request", Error.INVALID_REQUEST);
      }
      if (result != null) {
        var response = result.data;
        if (kDebugMode) {
          log(result.data.toString());
        }
        if (response["status"]) {
          return ApiResponse.completed(result.data);
        } else {
          return ApiResponse.error(response["message"], Error.DATA_FETCH_ERROR);
        }
      } else {
        return ApiResponse.error("Page Not Found", Error.INVALID_ROUTE);
      }
    } on dio.DioError catch (ex) {
      if (ex.type == dio.DioErrorType.connectTimeout) {
        return ApiResponse.error("Connection Timeout", Error.TIME_OUT_ERROR);
      }
      if (ex.response != null) {
        switch (ex.response!.statusCode) {
          case 404:
            return ApiResponse.error(
                ex.response!.data["message"], Error.DATA_FETCH_ERROR);
          case 403:
            return ApiResponse.error(
                ex.response!.data["message"], Error.DATA_FETCH_ERROR);
          default:
            return ApiResponse.error(
                "An Error occured ", Error.DATA_FETCH_ERROR);
        }
      } else {
        return ApiResponse.error("An Error occured ", Error.DATA_FETCH_ERROR);
      }
    }
  }
}
