import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:nxt_solutions_task/core/network/apis_constants.dart';
import 'package:nxt_solutions_task/core/network/status_code.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'custom_response.dart';

class NetworkHelper {
  bool debugging = true;
  Map<String, String> headers = HashMap();
  static final NetworkHelper _instance = NetworkHelper._privateConstructor();

  NetworkHelper._privateConstructor() {
    _initDio();
  }

  void _initDio() async {
    _dio = Dio(baseOptions);

    try {
      Directory cacheDir = await getTemporaryDirectory();
      final cacheOptions = CacheOptions(
        store: HiveCacheStore(cacheDir.path, hiveBoxName: "reservations"),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7),
        priority: CachePriority.high,
        cipher: null,
        // keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        keyBuilder: (request) {
          print("request");
          print(request.data);
          return request.uri.toString();
        },
        allowPostMethod: false,
      );

      _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    } catch (_) {}

// customization
    if (debugging) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  late Dio _dio;
  var baseOptions = BaseOptions(
    baseUrl: APIsConstants.baseURL,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    followRedirects: false,
    validateStatus: (status) {
      return status != null ? status < 500 : true;
    },
  );

  static NetworkHelper get instance => _instance;

  void _setJsonHeader() {
    // headers.putIfAbsent('Accept', () => '*/*');
    headers.putIfAbsent('Accept', () => 'application/json');
  }

  void _setAuthHeader(bool set) {
    if (set) {
      headers['Authorization'] = "Bearer ${APIsConstants.fixedToken}";
    } else {
      headers.remove('Authorization');
    }
  }

  Future<CustomResponse> get(
      {required String url,
      Map<String, dynamic>? queryParameters,
      bool setAuthToken = false}) async {
    _setJsonHeader();
    _setAuthHeader(setAuthToken);
    Response response;

    response = await _dio.get(url,
        queryParameters: queryParameters, options: Options(headers: headers));
    // ignore: prefer_typing_uninitialized_variables
    var data;
    String? errorMessage, successMessage;
    int? statusCode = response.statusCode;
    if (statusCode == 304) {
      statusCode = 200;
    }
    if (statusCode == StatusCode.success) {
      data = response.data;
    } else {
      errorMessage = response.data['message'] ?? AppStrings.somethingWentWrong;
    }
    return CustomResponse(
      data: data,
      statusCode: statusCode,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  Future<CustomResponse> post(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headersForRequest,
      bool setAuthToken = false,
      body,
      formData}) async {
    // _setJsonHeader();
    // _setHeaderContentType(contentType: 'application/x-www-form-urlencoded');
    _setAuthHeader(setAuthToken);
    Response? response;
    try {
      if (headersForRequest != null) {
        headersForRequest.forEach((key, value) {
          headers.putIfAbsent(key, () => value);
        });
      }
      response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: formData != null
            ? FormData.fromMap(formData)
            : body != null
                ? json.encode(body)
                : null,
        options: Options(
          headers: headers,
        ),
      );
      var data;
      String? errorMessage, successMessage;
      if (response.statusCode == StatusCode.success ||
          response.statusCode == StatusCode.created) {
        data = response.data;
      } else {
        errorMessage = response.data['message'] ?? "Something went wrong";
      }
      return CustomResponse(
        data: data,
        statusCode: response.statusCode,
        errorMessage: errorMessage,
        successMessage: successMessage,
      );
    } catch (e) {
      return CustomResponse(
        statusCode: response?.statusCode,
        errorMessage: "Something Went Wrong",
      );
    }
  }

  Future<CustomResponse> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headersForRequest,
    body,
  }) async {
    _setJsonHeader();
    Response? response;
    try {
      if (headersForRequest != null) {
        headersForRequest.forEach((key, value) {
          headers.putIfAbsent(key, () => value);
        });
      }
      response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: body != null ? json.encode(body) : null,
        options: Options(
          headers: headers,
        ),
      );
      var data;
      String? errorMessage, successMessage;
      if (response.statusCode == StatusCode.success ||
          response.statusCode == StatusCode.created) {
        data = response.data;
      } else {
        errorMessage = response.data['message'] ?? "Something went wrong";
      }
      return CustomResponse(
        data: data,
        statusCode: response.statusCode,
        errorMessage: errorMessage,
        successMessage: successMessage,
      );
    } catch (e) {
      return CustomResponse(
        statusCode: response?.statusCode,
        errorMessage: "Something Went Wrong",
      );
    }
  }
}
