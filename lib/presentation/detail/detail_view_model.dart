import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seoulheatshelter/core/result.dart';

import 'package:seoulheatshelter/domain/use_case/current_location_to_shelter_use_case.dart';
import 'package:seoulheatshelter/presentation/detail/detail_state.dart';
import 'package:seoulheatshelter/presentation/detail/detail_ui_event.dart';

class DetailViewModel with ChangeNotifier {
  DetailState _state = const DetailState();
  DetailState get state => _state;
  final CurrentLocationTShelter _currentLocationTShelter;

  final _eventController = StreamController<DetailUiEvent>();
  Stream<DetailUiEvent> get eventStream => _eventController.stream;

  DetailViewModel(this._currentLocationTShelter) {
    fetch();
  }

  Future<void> fetch() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _currentLocationTShelter.execute();

    switch (result) {
      case Success(:final data):
        _state = state.copyWith(isLoading: false, shelters: data);
        notifyListeners();
        notifyListeners();

        _eventController.add(const EndLoading());
      case Error(:final e):
        _eventController.add(ShowSnackBar(e));
    }
  }
}
