import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle_app/application/service/wordle_progress_service.dart';
import 'package:wordle_app/application/service/wordle_retrieve_service.dart';
import 'package:wordle_app/domain/wordle_game.dart';

part 'wordle_bloc.freezed.dart';
part 'wordle_event.dart';
part 'wordle_state.dart';

@injectable
class WordleBloc extends Bloc<WordleEvent, WordleState> {
  final WordleRetrieveService _retrieveService;
  final WordleProgressService _progressService;

  WordleBloc(this._retrieveService, this._progressService)
      : super(const WordleState.initial()) {
    on<WordleEvent>((event, emit) async {
      await event.when(
        load: () async {
          emit(const WordleState.loading());

          try {
            emit(WordleState.success(await _retrieveService.getWordle()));
          } catch (e) {
            emit(const WordleState.error());
          }
        },
        progress: (input) async {
          await state.whenOrNull(
            success: (game) async {
              final progressed =
                  await _progressService.progressWordle(game, input);

              emit(WordleState.success(progressed));
            },
          );
        },
      );
    });
  }
}
