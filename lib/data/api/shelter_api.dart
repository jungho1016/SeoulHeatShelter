import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:seoulheatshelter/domain/model/shelter.dart';

class ShelterApi {
  Future loadJSONData() async {
    String jsonString = await rootBundle.loadString('assets/shelter.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> jsonReusult = jsonData['DATA'];
    List<Shelter> shelters =
        jsonReusult.map((e) => Shelter.fromJson(e)).toList();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ShelterApi shelterApi = ShelterApi();
  shelterApi.loadJSONData();
}
