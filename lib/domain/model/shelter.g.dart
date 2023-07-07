// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shelter _$$_ShelterFromJson(Map<String, dynamic> json) => _$_Shelter(
      name: json['r_area_nm'] as String,
      address: json['r_detl_add'] as String,
      lot: (json['lo'] as num).toDouble(),
      lat: (json['la'] as num).toDouble(),
      use_available: json['use_prnb'] as num,
      air_conditioner: json['cler2_cnt'] as num,
      fan: json['cler1_cnt'] as num,
      km: json['km'] as num?,
    );

Map<String, dynamic> _$$_ShelterToJson(_$_Shelter instance) =>
    <String, dynamic>{
      'r_area_nm': instance.name,
      'r_detl_add': instance.address,
      'lo': instance.lot,
      'la': instance.lat,
      'use_prnb': instance.use_available,
      'cler2_cnt': instance.air_conditioner,
      'cler1_cnt': instance.fan,
      'km': instance.km,
    };
