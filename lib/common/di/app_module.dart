import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle_app/common/rest/rest_client.dart';

@module
abstract class AppModule {
  RestClient get restClient => RestClient(Dio());
}
