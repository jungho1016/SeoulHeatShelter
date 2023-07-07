import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seoulheatshelter/data/repository_impl/location_repository_impl.dart';
import 'package:seoulheatshelter/data/repository_impl/shelter_repository_imple.dart';

import 'package:seoulheatshelter/domain/model/shelter.dart';

class DetailViewModel with ChangeNotifier {
  List<Shelter> shelters = [];
  bool isLoading = false;
  LocationRepository _locationRepository = LocationRepository();
  ShelterRepositoryImpl shelterRepository = ShelterRepositoryImpl();

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
