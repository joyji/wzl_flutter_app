import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

import 'package:wzl_flutter_app/widget/loading.dart';

class NetUtils {
  static Dio _dio;

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);

    dynamic options = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        HttpHeaders.userAgentHeader: 'dio',
        'common-header': 'xx'
      }
    );
    _dio = Dio(options)
    ..interceptors.add(CookieManager(cj))
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (Options options) async {
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse:(Response response) async {
        // 在返回响应数据之前做一些预处理
        print(response);
        if (response.statusCode == 200) {
          return response; // continue
        }
      },
      onError: (DioError e) async {
        // 当请求失败时做一些预处理
        return e;//continue
      }
    ))
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> request(BuildContext context, String url, { String method = "get", Map<String, dynamic> params, bool isShowLoading = true }) async {
    if (isShowLoading) Loading.showLoading(context);
    //  1. 单独相关设置
    Options options = Options();
    options.method = method;

    //  2. 发送请求
    try {
      return await _dio.request(url, queryParameters: params, options: options);
    } on DioError catch (e) {
      if (e.response == null) {
        Future.delayed(Duration(milliseconds: 200), () {

        });
        return Future.error(0);
      } else if (e.response is Map) {
        return Future.value(e.response);
      } else {
        return Future.error(0);
      }
    } finally {
      Loading.hideLoading(context);
    }
  }
//  static Future<Response> _get(BuildContext context, String url, { Map<String, dynamic> params, bool isShowLoading = true }) async {
//    if (isShowLoading) Loading.showLoading(context);
//    try {
//      return await _dio.get(url, queryParameters: params);
//    } on DioError catch (e) {
//      if (e.response == null) {
//        Future.delayed(Duration(milliseconds: 200), () {
//
//        });
//        return Future.error(0);
//      } else if (e.response is Map) {
//        return Future.value(e.response);
//      } else {
//        return Future.error(0);
//      }
//    } finally {
//      Loading.hideLoading(context);
//    }
//  }
//
//  static Future<Response> _post(BuildContext context, String url, { Map<String, dynamic> params, bool isShowLoading = true }) async {
//    if (isShowLoading) Loading.showLoading(context);
//    try {
//      return await _dio.post(url, queryParameters: params);
//    } on DioError catch (e) {
//      // The request was made and the server responded with a status code
//      // that falls out of the range of 2xx and is also not 304.
//      if (e.response is Map) {
//        print(e.response.data);
//        print(e.response.headers);
//        print(e.response.request);
//      } else {
//        // Something happened in setting up or sending the request that triggered an Error
//        print(e.request);
//        print(e.message);
//      }
//    } finally {
//      Loading.hideLoading(context);
//    }
//  }
}