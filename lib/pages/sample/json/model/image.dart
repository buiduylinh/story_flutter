import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'desc')
  final String desc;


  Image(this.icon, this.name, this.desc);

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}