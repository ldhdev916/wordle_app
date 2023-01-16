import 'package:another_flushbar/flushbar_helper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wordle_app/common/di/get_it.dart';
import 'package:wordle_app/domain/value/word_state.dart';
import 'package:wordle_app/domain/wordle_game.dart';
import 'package:wordle_app/presentation/bloc/validate/validate_bloc.dart';
import 'package:wordle_app/presentation/bloc/wordle_bloc.dart';

const kFieldWidth = 50.0;
const kFieldHeight = 50.0;

const kKeyboardTexts = [
  ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
  ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
  ['z', 'x', 'c', 'v', 'b', 'n', 'm'],
];

class WordleView extends StatelessWidget {
  const WordleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<WordleBloc>()..add(const WordleEvent.load()),
        ),
        BlocProvider(
          create: (context) => getIt<ValidateBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("워들"),
          centerTitle: true,
        ),
        body: BlocBuilder<WordleBloc, WordleState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (game) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _WordleLayout(game: game),
              ),
            ),
            error: () => const Center(child: Text("오류")),
          ),
        ),
      ),
    );
  }
}

class _WordleLayout extends StatelessWidget {
  final WordleGame game;

  const _WordleLayout({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidateBloc, ValidateState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (word) =>
              context.read<WordleBloc>().add(WordleEvent.progress(word)),
          error: () => FlushbarHelper.createError(message: "올바르지 않은 단어 입니다")
              .show(context),
        );
      },
      child: game.completed
          ? const Center(child: Text("성공"))
          : game.failed
              ? const Center(child: Text("실패"))
              : Column(
                  children: [
                    ...List.generate(6,
                        (index) => _WordleTextField(game: game, index: index)),
                    const SizedBox(height: 60),
                    _KeyboardWidget(game: game),
                  ],
                ),
    );
  }
}

class _KeyboardWidget extends StatelessWidget {
  final WordleGame game;

  const _KeyboardWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = <String, WordState>{};

    for (final word in game.progress) {
      final states = game.correctWord.calculate(word);

      states.forEachIndexed((index, element) {
        final value = word.value[index];
        final currentState = map[value];

        if (currentState == null) {
          map[value] = element;
        } else {
          switch (currentState) {
            case WordState.correct:
              break;
            case WordState.miss:
              if (element == WordState.correct) {
                map[value] = element;
              }
              break;
            case WordState.wrong:
              if (element != WordState.wrong) {
                map[value] = element;
              }
              break;
          }
        }
      });
    }

    return Column(
      children: kKeyboardTexts
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: e
                    .map(
                      (e) => Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _KeyboardField(
                            value: e, state: map[e] ?? WordState.wrong),
                      )),
                    )
                    .toList(),
              ))
          .toList(),
    );
  }
}

class _KeyboardField extends StatelessWidget {
  final String value;
  final WordState state;

  const _KeyboardField({Key? key, required this.value, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: state.mapToColor(),
      height: kFieldHeight,
      alignment: AlignmentDirectional.center,
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}

class _WordleTextField extends StatelessWidget {
  final WordleGame game;
  final int index;

  const _WordleTextField({Key? key, required this.game, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length = game.progress.length;
    if (index < length) {
      final word = game.progress[index];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: game.correctWord
            .calculate(word)
            .mapIndexed((index, element) =>
                _WordWidget(value: word.value[index], state: element))
            .toList(),
      );
    } else {
      return PinCodeTextField(
        appContext: context,
        length: 5,
        onChanged: (s) {
          if (s.length == 5) {
            context
                .read<ValidateBloc>()
                .add(ValidateEvent.validate(s.toLowerCase()));
          }
        },
        enabled: index == length,
        enablePinAutofill: false,
        textCapitalization: TextCapitalization.characters,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          inactiveColor: Colors.black,
          activeColor: Colors.grey,
          selectedColor: Colors.grey,
          disabledColor: Colors.red.shade800,
          fieldWidth: kFieldWidth,
          fieldHeight: kFieldHeight,
        ),
        keyboardType: TextInputType.text,
      );
    }
  }
}

class _WordWidget extends StatelessWidget {
  final String value;
  final WordState state;

  const _WordWidget({Key? key, required this.value, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: kFieldWidth,
        height: kFieldHeight,
        alignment: AlignmentDirectional.center,
        color: state.mapToColor(),
        child: Text(
          value.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
