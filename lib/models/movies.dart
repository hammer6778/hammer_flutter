
import 'package:json_annotation/json_annotation.dart';
part 'Movies.g.dart';

@JsonSerializable()

class Movies {
  Movies();

  late List list;

  factory Movies.fromJson(Map<String,dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}