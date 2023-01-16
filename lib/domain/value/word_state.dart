import 'package:flutter/material.dart';

enum WordState {
  correct,
  miss,
  wrong;

  Color mapToColor() {
    switch (this) {
      case WordState.correct:
        return Colors.green.shade600;
      case WordState.miss:
        return Colors.yellow.shade800;
      case WordState.wrong:
        return Colors.grey;
    }
  }
}
