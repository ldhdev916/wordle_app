import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordle_app/domain/value/word_state.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const Word._();

  @Assert("value.length == 5")
  const factory Word(String value) = _Word;

  List<WordState> calculate(Word input) {
    final result = <WordState>[];
    for (var i = 0; i < value.length; i++) {
      final inputValue = input.value[i];

      if (value[i] == inputValue) {
        result.add(WordState.correct);
      } else if (value.contains(inputValue)) {
        result.add(WordState.miss);
      } else {
        result.add(WordState.wrong);
      }
    }
    return result;
  }
}
