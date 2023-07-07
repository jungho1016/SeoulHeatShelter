import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/data/repository_impl/location_repository_impl.dart';
import 'package:seoulheatshelter/data/repository_impl/shelter_repository_imple.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';
import 'package:seoulheatshelter/presentation/detail/detail_state.dart';

class DetailViewModel with ChangeNotifier {
  DetailState _state = const DetailState();
  DetailState get state => _state;
  final LocationRepository _locationRepository = LocationRepository();
  final ShelterRepositoryImpl _shelterRepository = ShelterRepositoryImpl();

  Future<void> fetch() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await _locationRepository.determinePosition();
    Position position = await _locationRepository.getCurrenLocation();

    List<Shelter> shelters = await _shelterRepository.fetch(
      position.latitude,
      position.longitude,
    );

    _state = state.copyWith(isLoading: false, shelters: shelters);
    notifyListeners();
  }
}
