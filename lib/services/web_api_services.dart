import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/utils/urls.dart' as urls;
import '_mixins_api.dart';

class WebAPIService with WebAPIMixin {
  WebAPIService._initialise()
      : _dio = Dio(BaseOptions(
            // connectTimeout: 5000, receiveTimeout: 3000,
            headers: {
              "accept": "application/json",
            })) {
    if (kDebugMode) {
      dio
        ..interceptors.add(LogInterceptor(
          responseHeader: false,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ));
      // ..interceptors.add(AppStackInterceptorBuilder.appStackInterceptor);
    }
  }

  factory WebAPIService() => WebAPIService._initialise();

  final Dio _dio;

  Dio get dio => _dio;

  Future<bool> initTokenToHeader({bool initToken = true}) =>
      getTokenFromSharedPref().then((token) {
        if (token?.isEmpty ?? true) {
          return true;
        }
        if (_dio.options.headers.containsKey('Authorization')) {
          _dio.options.headers.remove('Authorization');
        }
        if (initToken) {
          _dio.options.headers
              .putIfAbsent('Authorization', () => 'Bearer $token');
          debugPrint('Authorization==>${token!}');
        }
        return true;
      });

  ///initialize language code in header
  Future<bool> initLangPrefToHeader() =>
      getLanguageSharedPref().then((languageCode) async {
        if (_dio.options.headers.containsKey('lang')) {
          _dio.options.headers.remove('lang');
        }
        _dio.options.headers.putIfAbsent('lang', () => languageCode ?? 'en');
        return true;
      });

  ///initialize tenant code in header
  Future<bool> initTenantPrefToHeader() =>
      getTenantCodeSharedPref().then((tenantCode) async {
        if (_dio.options.headers.containsKey('tenant')) {
          _dio.options.headers.remove('tenant');
        }
        _dio.options.headers.putIfAbsent('tenant', () => tenantCode ?? '0');
        return true;
      });


}
