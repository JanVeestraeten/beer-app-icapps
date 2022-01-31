import 'package:beer_app_icapps/base/get_it.dart';
import 'package:beer_app_icapps/base/secure_storage.dart';
import 'package:beer_app_icapps/models/web/login_response.dart';
import 'package:beer_app_icapps/networking/do_call.dart';
import 'package:beer_app_icapps/services/network_service.dart';

class AuthRepository {
  static final unprotectedClient =
      getIt.get<NetworkService>().unprotectedService;

  static Future<void> getToken(
      {required String username, required String password}) async {
    await doCall<LoginResponse>(
      unprotectedClient.login(username: username, password: password),
      succesFunction: (loginResponse) async {
        String? accessToken = loginResponse.data?.accessToken;
        String? refreshToken = loginResponse.data?.refreshToken;

        if (accessToken != null) {
          await SecureStorage.writeSecureData(
              SecureStorage.ACCESS_TOKEN, accessToken);
        } else if (refreshToken != null) {
          await SecureStorage.writeSecureData(
              SecureStorage.REFRESH_TOKEN, refreshToken);
        }
      },
    );
  }
}
