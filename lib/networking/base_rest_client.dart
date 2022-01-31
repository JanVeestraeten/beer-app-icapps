// ignore_for_file: unnecessary_new

import 'dart:io';
import 'package:beer_app_icapps/base/globals.dart';
import 'package:beer_app_icapps/base/secure_storage.dart';
import 'package:beer_app_icapps/networking/error_interceptor.dart';
import 'package:dio/dio.dart';

abstract class BaseRestClient {
  String apiUrl();
  bool isProtected();

  Dio normalDio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 6000,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
        }),
  )..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        ErrorInterceptor(),
      ],
    );

  Dio get dio {
    BaseOptions options = BaseOptions(
        baseUrl: apiUrl(),
        connectTimeout: 10000,
        receiveTimeout: 6000,
        headers: {
          HttpHeaders.acceptHeader: "application/json",
        });

    var dio = Dio(options);

    dio
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ))
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          if (isProtected()) {
            String? accessToken =
                await SecureStorage.readSecureData(SecureStorage.ACCESS_TOKEN);

            options.headers.addAll(
                {HttpHeaders.authorizationHeader: "Bearer $accessToken"});
          }

          handler.next(options);
        },
        onError: (error, handler) async {
          if (isProtected() && error.response?.statusCode == 401) {
            //do refresh call
            try {
              String? refreshToken = await SecureStorage.readSecureData(
                  SecureStorage.REFRESH_TOKEN);

              var response = await normalDio.post(
                "https://icapps-nodejs-beers-api.herokuapp.com/api/v1/auth/refresh",
                data: {
                  "refreshToken": refreshToken,
                },
              );

              if (response.statusCode == 200 &&
                  response.data["data"]["accessToken"] != null) {
                String newAccessToken = response.data["data"]["accessToken"];
                String newRefreshToken = response.data["data"]["refreshToken"];
                await SecureStorage.writeSecureData(
                    SecureStorage.ACCESS_TOKEN, newAccessToken);

                await SecureStorage.writeSecureData(
                    SecureStorage.REFRESH_TOKEN, newRefreshToken);

                final opts = new Options(
                    method: error.requestOptions.method,
                    headers: {
                      HttpHeaders.authorizationHeader: "Bearer $newAccessToken"
                    });
                final cloneReq = await normalDio.request(
                    error.requestOptions.path,
                    options: opts,
                    data: error.requestOptions.data,
                    queryParameters: error.requestOptions.queryParameters);

                return handler.resolve(cloneReq);
              } else {
                return;
              }
            } catch (e) {
              await logout();
              return;
            }
            //! NO PROTECTED CALL
          } else {
            return handler.next(error);
          }
        },
      ))
      ..interceptors.add(ErrorInterceptor());

    return dio;
  }
}
