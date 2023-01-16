import 'package:wordle_app/domain/wordle_game.dart';

abstract class GameRepository {
  Future<WordleGame?> getGame();

  Future<void> save(WordleGame entity);
}
