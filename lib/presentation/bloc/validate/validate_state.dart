part of 'validate_bloc.dart';

@freezed
class ValidateState with _$ValidateState {
  const factory ValidateState.initial() = _Initial;

  const factory ValidateState.loading() = _Loading;

  const factory ValidateState.success(String word) = _Validated;

  const factory ValidateState.error() = _Failed;
}
