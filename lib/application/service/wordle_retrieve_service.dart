import 'package:injectable/injectable.dart';
import 'package:wordle_app/domain/factory/game_factory.dart';
import 'package:wordle_app/domain/repository/game_repository.dart';
import 'package:wordle_app/domain/wordle_game.dart';

@lazySingleton
class WordleRetrieveService {
  final GameRepository _repository;
  final GameFactory _factory;

  WordleRetrieveService(this._repository, this._factory);

  Future<WordleGame> getWordle() async {
    final onGoing = await _repository.getGame();

    if (onGoing != null) return onGoing;

    final game = await _factory.createNewGame();

    await _repository.save(game);

    return game;
  }
}
