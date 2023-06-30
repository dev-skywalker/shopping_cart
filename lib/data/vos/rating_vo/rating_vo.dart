import 'package:json_annotation/json_annotation.dart';

part 'rating_vo.g.dart';

@JsonSerializable()
class RatingVO{

  @JsonKey(name: 'rate')
  final double rate;

  @JsonKey(name: 'count')
  final int count;

  RatingVO(this.rate, this.count);

  factory RatingVO.fromJson(Map<String,dynamic>json)=>_$RatingVOFromJson(json);
}