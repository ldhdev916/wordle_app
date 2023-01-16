// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wordle_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordleGame {
  Word get correctWord => throw _privateConstructorUsedError;
  List<Word> get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordleGameCopyWith<WordleGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordleGameCopyWith<$Res> {
  factory $WordleGameCopyWith(
          WordleGame value, $Res Function(WordleGame) then) =
      _$WordleGameCopyWithImpl<$Res, WordleGame>;
  @useResult
  $Res call({Word correctWord, List<Word> progress});

  $WordCopyWith<$Res> get correctWord;
}

/// @nodoc
class _$WordleGameCopyWithImpl<$Res, $Val extends WordleGame>
    implements $WordleGameCopyWith<$Res> {
  _$WordleGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctWord = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      correctWord: null == correctWord
          ? _value.correctWord
          : correctWord // ignore: cast_nullable_to_non_nullable
              as Word,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get correctWord {
    return $WordCopyWith<$Res>(_value.correctWord, (value) {
      return _then(_value.copyWith(correctWord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WordleGameCopyWith<$Res>
    implements $WordleGameCopyWith<$Res> {
  factory _$$_WordleGameCopyWith(
          _$_WordleGame value, $Res Function(_$_WordleGame) then) =
      __$$_WordleGameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Word correctWord, List<Word> progress});

  @override
  $WordCopyWith<$Res> get correctWord;
}

/// @nodoc
class __$$_WordleGameCopyWithImpl<$Res>
    extends _$WordleGameCopyWithImpl<$Res, _$_WordleGame>
    implements _$$_WordleGameCopyWith<$Res> {
  __$$_WordleGameCopyWithImpl(
      _$_WordleGame _value, $Res Function(_$_WordleGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correctWord = null,
    Object? progress = null,
  }) {
    return _then(_$_WordleGame(
      null == correctWord
          ? _value.correctWord
          : correctWord // ignore: cast_nullable_to_non_nullable
              as Word,
      null == progress
          ? _value._progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc

class _$_WordleGame extends _WordleGame {
  const _$_WordleGame(this.correctWord, [final List<Word> progress = const []])
      : _progress = progress,
        super._();

  @override
  final Word correctWord;
  final List<Word> _progress;
  @override
  @JsonKey()
  List<Word> get progress {
    if (_progress is EqualUnmodifiableListView) return _progress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progress);
  }

  @override
  String toString() {
    return 'WordleGame(correctWord: $correctWord, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordleGame &&
            (identical(other.correctWord, correctWord) ||
                other.correctWord == correctWord) &&
            const DeepCollectionEquality().equals(other._progress, _progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, correctWord, const DeepCollectionEquality().hash(_progress));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordleGameCopyWith<_$_WordleGame> get copyWith =>
      __$$_WordleGameCopyWithImpl<_$_WordleGame>(this, _$identity);
}

abstract class _WordleGame extends WordleGame {
  const factory _WordleGame(final Word correctWord,
      [final List<Word> progress]) = _$_WordleGame;
  const _WordleGame._() : super._();

  @override
  Word get correctWord;
  @override
  List<Word> get progress;
  @override
  @JsonKey(ignore: true)
  _$$_WordleGameCopyWith<_$_WordleGame> get copyWith =>
      throw _privateConstructorUsedError;
}
