import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movieItem.g.dart';
@JsonSerializable()
class MovieItem {
  String name = '';
  String imgurl = '';
  MovieItem(this.name, this.imgurl);
  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);
  // Map<String, dynamic>toJson() => $MovieItemToJson(this);
}
