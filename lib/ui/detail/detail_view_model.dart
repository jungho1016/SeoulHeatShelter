import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/data/repository/location_repository.dart';
import 'package:seoulheatshelter/data/repository/shelter_repository.dart';
import 'package:seoulheatshelter/domain/model/shelter.dart';

class DetailViewModel with ChangeNotifier {
  List<Shelter> shelters = [];
  bool isLoading = false;
  LocationRepository _locationRepository = LocationRepository();
  ShelterRepository shelterRepository = ShelterRepository();

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    _locationRepository.determinePosition();
    Position position = await _locationRepository.getCurrenLocation();
    shelters =
        await shelterRepository.fetch(position.latitude, position.longitude);

    isLoading = false;
    notifyListeners();
  }
}
