import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'shelter.freezed.dart';
part 'shelter.g.dart';

class MyJsonKey extends JsonKey {
  const MyJsonKey({required String name}) : super(name: name);
}

@freezed
class Shelter with _$Shelter {
  const factory Shelter({
    @MyJsonKey(name: 'r_area_nm') required String name,
    @MyJsonKey(name: 'r_detl_add') required String address,
    @MyJsonKey(name: 'lo') required double lot,
    @MyJsonKey(name: 'la') required double lat,
    @MyJsonKey(name: 'use_prnb') required num use_available,
    @MyJsonKey(name: 'cler2_cnt') required num air_conditioner,
    @MyJsonKey(name: 'cler1_cnt') required num fan,
    num? km,
    num? m,
  }) = _Shelter;

  factory Shelter.fromJson(Map<String, Object?> json) =>
      _$ShelterFromJson(json);
}
