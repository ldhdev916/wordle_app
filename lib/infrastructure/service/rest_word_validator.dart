import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle_app/application/service/word_validator.dart';
import 'package:wordle_app/common/rest/rest_client.dart';

@LazySingleton(as: WordValidator)
class RestWordValidator implements WordValidator {
  final RestClient _client;

  RestWordValidator(this._client);

  @override
  Future<bool> validateWord(String word) async {
    try {
      await _client.validateWord(word);

      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return false;
      }
      rethrow;
    }
  }
}
