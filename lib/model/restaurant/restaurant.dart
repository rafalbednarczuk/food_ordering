import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable(nullable: false)
class Restaurant extends Equatable {
  final int id;
  final String name;

  Restaurant(this.id, this.name);

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  @override
  List<Object> get props => [id, name];
}
