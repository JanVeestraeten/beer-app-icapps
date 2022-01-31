import 'package:beer_app_icapps/networking/api_manager_service.dart';
import 'package:beer_app_icapps/networking/protected_rest_client.dart';
import 'package:beer_app_icapps/networking/unprotected_rest_client.dart';

class NetworkService {
  final ApiManagerService protectedService =
      ApiManagerService(ProtectedRestClient().dio);
  final ApiManagerService unprotectedService =
      ApiManagerService(UnProtectedRestClient().dio);
}
