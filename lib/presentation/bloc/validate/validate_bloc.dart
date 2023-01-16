import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle_app/application/service/word_validator.dart';

part 'validate_bloc.freezed.dart';
part 'validate_event.dart';
part 'validate_state.dart';

@injectable
class ValidateBloc extends Bloc<ValidateEvent, ValidateState> {
  final WordValidator _validator;

  ValidateBloc(this._validator) : super(const ValidateState.initial()) {
    on<ValidateEvent>((event, emit) async {
      emit(const ValidateState.loading());

      try {
        final result = await _validator.validateWord(event.word);

        if (result) {
          emit(ValidateState.success(event.word));
        } else {
          emit(const ValidateState.error());
        }
      } catch (e) {
        emit(const ValidateState.error());
      }
    });
  }
}
