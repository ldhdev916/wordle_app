import 'package:wordle_app/domain/wordle_game.dart';

abstract class GameFactory {
  Future<WordleGame> createNewGame();
}
