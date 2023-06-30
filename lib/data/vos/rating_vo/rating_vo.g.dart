// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingVO _$RatingVOFromJson(Map<String, dynamic> json) => RatingVO(
      (json['rate'] as num).toDouble(),
      json['count'] as int,
    );

Map<String, dynamic> _$RatingVOToJson(RatingVO instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
