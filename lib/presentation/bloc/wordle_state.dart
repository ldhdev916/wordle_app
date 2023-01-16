part of 'wordle_bloc.dart';

@freezed
class WordleState with _$WordleState {
  const factory WordleState.initial() = _Initial;

  const factory WordleState.loading() = _Loading;

  const factory WordleState.success(WordleGame game) = _Success;

  const factory WordleState.error() = _Error;
}
