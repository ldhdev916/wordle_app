import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:wordle_app/common/rest/rest_client.dart';
import 'package:wordle_app/domain/factory/game_factory.dart';
import 'package:wordle_app/domain/value/word.dart';
import 'package:wordle_app/domain/wordle_game.dart';

@LazySingleton(as: GameFactory)
class RestGameFactory implements GameFactory {
  final RestClient _client;

  RestGameFactory(this._client);

  @override
  Future<WordleGame> createNewGame() async {
    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final word = (await _client.getWord(date)).solution;

    return WordleGame(Word(word));
  }
}
