import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wordle_app/infrastructure/model/solution.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("https://www.nytimes.com/svc/wordle/v2/{date}.json")
  Future<Solution> getWord(@Path("date") String date);

  @GET("https://api.dictionaryapi.dev/api/v2/entries/en/{word}")
  Future<void> validateWord(@Path("word") String word);
}
