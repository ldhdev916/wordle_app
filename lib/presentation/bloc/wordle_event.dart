part of 'wordle_bloc.dart';

@freezed
class WordleEvent with _$WordleEvent {
  const factory WordleEvent.load() = _Load;

  const factory WordleEvent.progress(String input) = _Progress;
}
