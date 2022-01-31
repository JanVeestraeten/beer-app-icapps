import 'package:beer_app_icapps/models/web/beer_repository.dart';
import 'package:beer_app_icapps/models/web/beers_response.dart';
import 'package:beer_app_icapps/models/web/breweries_response.dart';
import 'package:beer_app_icapps/models/web/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_manager_service.g.dart';

@RestApi()
//! flutter pub run build_runner watch --delete-conflicting-outputs
abstract class ApiManagerService {
  factory ApiManagerService(Dio dio, {String baseUrl}) = _ApiManagerService;

  //* LOGIN
  @POST("auth/login")
  Future<LoginResponse> login({
    @Field("username") required String username,
    @Field("password") required String password,
  });

  //* REFRESH TOKEN
  @POST("auth/refresh")
  Future<dynamic> refreshToken({
    @Field("refreshToken") required String refreshToken,
  });

  //* GET BEERS
  @GET("beers")
  Future<BeersResponse> getBeers();

  //* GET BEER DETAIL
  @GET("beers/{id}")
  Future<BeerResponse> getBeerDetail({
    @Path("id") required String id,
  });

  //* GET BREWERIES
  @GET("beers")
  Future<BreweryResponse> getBreweries();

  //* RATE BEER
  @PUT("beers/{id}")
  Future<BeerResponse> rateBeer({
    @Path("id") required String id,
    @Field("rating") required int rating,
  });
}
