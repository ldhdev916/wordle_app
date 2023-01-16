import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution.freezed.dart';
part 'solution.g.dart';

@freezed
class Solution with _$Solution {
  const factory Solution(String solution) = _Solution;

  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);
}
