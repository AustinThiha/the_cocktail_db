import 'package:dio/dio.dart';
import 'package:flutter_retrofit_basic/models/base_response.dart';
import 'package:flutter_retrofit_basic/models/cock_tail.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_category.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_details.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  // i=11007
  @GET("/lookup.php")
  Future<BaseResponse<CockTailDetails>> getDetails(@Query("i") String id);

  @GET("/list.php?c=list")
  Future<BaseResponse<CockTailCategory>> getCategories();

  // c=Ordinary_Drink
  @GET("/filter.php")
  Future<BaseResponse<Cocktail>> getCocktailList(
      @Query("c") String categoryName);
}
