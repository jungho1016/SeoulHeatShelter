import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';

part 'detail_state.freezed.dart';

part 'detail_state.g.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState(
      {@Default([]) List<Shelter> shelters,
      @Default(false) bool isLoading}) = _DetailState;

  factory DetailState.fromJson(Map<String, Object?> json) =>
      _$DetailStateFromJson(json);
}
