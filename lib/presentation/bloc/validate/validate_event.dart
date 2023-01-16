part of 'validate_bloc.dart';

@freezed
class ValidateEvent with _$ValidateEvent {
  const factory ValidateEvent.validate(String word) = _Validate;
}
