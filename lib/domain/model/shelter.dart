import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'shelter.freezed.dart';

part 'shelter.g.dart';

@freezed
class Shelter with _$Shelter {
  const factory Shelter(
      {required String r_area_nm,
      required String r_detl_add,
      required num lo,
      required num la,
      required num use_prnb,
      required num cler2_cnt,
      required num cler1_cnt,
      required}) = _Shelter;

  factory Shelter.fromJson(Map<String, Object?> json) =>
      _$ShelterFromJson(json);
}
