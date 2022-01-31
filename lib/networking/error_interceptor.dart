import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  Future onError(DioError error, handler) async {
    print(error.response.toString());

    late DioError dioError;

    //if there is no network available
    if (error.response == null) {
      dioError = DioError(
          requestOptions: error.requestOptions,
          error: S.current.network_error_no_internet_connection);
      return handler.reject(dioError);
    }

    switch (error.response?.statusCode) {
      case 400:
        {
          var validationError = error.response?.data["message"];

          dioError = DioError(
              requestOptions: error.requestOptions,
              error: validationError ?? S.current.login_error);

          break;
        }
      case 401:
        {
          dioError = DioError(
              requestOptions: error.requestOptions,
              error: S.current.login_error);
          break;
        }
      case 404:
        {
          dioError = DioError(
              requestOptions: error.requestOptions,
              error: S.current.network_error);
          break;
        }
      case 422:
        {
          var validationError = error.response?.data["errors"];

          String msg = validationError == null ? S.current.error_default : "";
          validationError?.forEach((key, value) {
            for (var item in value) {
              msg += "$item\n";
            }
          });

          dioError =
              DioError(requestOptions: error.requestOptions, error: msg.trim());

          break;
        }
      default:
        {
          dioError = DioError(
              requestOptions: error.requestOptions,
              error: S.current.error_default);
          break;
        }
    }

    handler.reject(dioError);
  }
}
