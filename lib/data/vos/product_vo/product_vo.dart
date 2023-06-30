import 'package:json_annotation/json_annotation.dart';
import '../rating_vo/rating_vo.dart';

part 'product_vo.g.dart';

@JsonSerializable()
class ProductVO{
  //Members
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'price')
  final double? price;

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'rating')
  final RatingVO? rating;


  //Constructor
ProductVO(this.id, this.title, this.price, this.description,this.category, this.rating);


//   //factory constructor
factory ProductVO.fromJson(Map<String,dynamic> json)=>_$ProductVOFromJson(json);

  //Map
}