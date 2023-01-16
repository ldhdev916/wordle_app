// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return _Solution.fromJson(json);
}

/// @nodoc
mixin _$Solution {
  String get solution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolutionCopyWith<Solution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionCopyWith<$Res> {
  factory $SolutionCopyWith(Solution value, $Res Function(Solution) then) =
      _$SolutionCopyWithImpl<$Res, Solution>;
  @useResult
  $Res call({String solution});
}

/// @nodoc
class _$SolutionCopyWithImpl<$Res, $Val extends Solution>
    implements $SolutionCopyWith<$Res> {
  _$SolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solution = null,
  }) {
    return _then(_value.copyWith(
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SolutionCopyWith<$Res> implements $SolutionCopyWith<$Res> {
  factory _$$_SolutionCopyWith(
          _$_Solution value, $Res Function(_$_Solution) then) =
      __$$_SolutionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String solution});
}

/// @nodoc
class __$$_SolutionCopyWithImpl<$Res>
    extends _$SolutionCopyWithImpl<$Res, _$_Solution>
    implements _$$_SolutionCopyWith<$Res> {
  __$$_SolutionCopyWithImpl(
      _$_Solution _value, $Res Function(_$_Solution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solution = null,
  }) {
    return _then(_$_Solution(
      null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Solution implements _Solution {
  const _$_Solution(this.solution);

  factory _$_Solution.fromJson(Map<String, dynamic> json) =>
      _$$_SolutionFromJson(json);

  @override
  final String solution;

  @override
  String toString() {
    return 'Solution(solution: $solution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Solution &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, solution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolutionCopyWith<_$_Solution> get copyWith =>
      __$$_SolutionCopyWithImpl<_$_Solution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SolutionToJson(
      this,
    );
  }
}

abstract class _Solution implements Solution {
  const factory _Solution(final String solution) = _$_Solution;

  factory _Solution.fromJson(Map<String, dynamic> json) = _$_Solution.fromJson;

  @override
  String get solution;
  @override
  @JsonKey(ignore: true)
  _$$_SolutionCopyWith<_$_Solution> get copyWith =>
      throw _privateConstructorUsedError;
}
