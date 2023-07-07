import 'package:flutter/material.dart';

import 'package:seoulheatshelter/domain/use_case/current_location_to_shelter.dart';
import 'package:seoulheatshelter/presentation/detail/detail_state.dart';

class DetailViewModel with ChangeNotifier {
  DetailState _state = const DetailState();
  DetailState get state => _state;
  final CurrentLocationTShelter _currentLocationTShelter;

  DetailViewModel(this._currentLocationTShelter) {
    fetch();
  }

  Future<void> fetch() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final shelters = await _currentLocationTShelter.execute();

    _state = state.copyWith(isLoading: false, shelters: shelters);
    notifyListeners();
  }
}
