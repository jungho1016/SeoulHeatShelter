// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shelter _$$_ShelterFromJson(Map<String, dynamic> json) => _$_Shelter(
      r_area_nm: json['r_area_nm'] as String,
      r_detl_add: json['r_detl_add'] as String,
      lo: json['lo'] as num,
      la: json['la'] as num,
      use_prnb: json['use_prnb'] as num,
      cler2_cnt: json['cler2_cnt'] as num,
      cler1_cnt: json['cler1_cnt'] as num,
      required: json['required'],
    );

Map<String, dynamic> _$$_ShelterToJson(_$_Shelter instance) =>
    <String, dynamic>{
      'r_area_nm': instance.r_area_nm,
      'r_detl_add': instance.r_detl_add,
      'lo': instance.lo,
      'la': instance.la,
      'use_prnb': instance.use_prnb,
      'cler2_cnt': instance.cler2_cnt,
      'cler1_cnt': instance.cler1_cnt,
      'required': instance.required,
    };
