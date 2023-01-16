import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordle_app/common/consts.dart';
import 'package:wordle_app/domain/value/word.dart';
import 'package:wordle_app/domain/value/word_state.dart';

part 'wordle_game.freezed.dart';

@freezed
class WordleGame with _$WordleGame {
  const WordleGame._();

  const factory WordleGame(Word correctWord,
      [@Default([]) List<Word> progress]) = _WordleGame;

  bool get completed => progress.any((element) => element
      .calculate(correctWord)
      .every((element) => element == WordState.correct));

  bool get failed => !completed && progress.length == kMaxWords;
}
