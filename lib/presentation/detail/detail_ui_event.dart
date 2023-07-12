import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'detail_ui_event.freezed.dart';

@freezed
sealed class DetailUiEvent<T> with _$DetailUiEvent<T> {
  const factory DetailUiEvent.showSnackBar(String message) = ShowSnackBar;
  const factory DetailUiEvent.endLoading() = EndLoading;
}
