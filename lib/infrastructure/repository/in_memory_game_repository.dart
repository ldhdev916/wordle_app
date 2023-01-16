import 'package:injectable/injectable.dart';
import 'package:wordle_app/domain/repository/game_repository.dart';
import 'package:wordle_app/domain/wordle_game.dart';

@LazySingleton(as: GameRepository)
class InMemoryGameRepository implements GameRepository {
  WordleGame? _game;

  @override
  Future<WordleGame?> getGame() async => _game;

  @override
  Future<void> save(WordleGame entity) async {
    _game = entity;
  }
}
