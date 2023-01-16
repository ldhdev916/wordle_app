import 'package:injectable/injectable.dart';
import 'package:wordle_app/application/service/word_validator.dart';
import 'package:wordle_app/domain/repository/game_repository.dart';
import 'package:wordle_app/domain/value/word.dart';
import 'package:wordle_app/domain/wordle_game.dart';

@lazySingleton
class WordleProgressService {
  final GameRepository _repository;
  final WordValidator _validator;

  WordleProgressService(this._repository, this._validator);

  Future<WordleGame> progressWordle(WordleGame game, String input) async {
    final word = Word(input);

    final progressed = game.copyWith(progress: [...game.progress, word]);

    await _repository.save(progressed);

    return progressed;
  }
}
