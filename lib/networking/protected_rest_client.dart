import 'package:beer_app_icapps/base/globals.dart';
import 'package:beer_app_icapps/networking/base_rest_client.dart';

class ProtectedRestClient extends BaseRestClient {
  ProtectedRestClient();

  @override
  String apiUrl() {
    return baseUrl;
  }

  @override
  bool isProtected() {
    return true;
  }
}
