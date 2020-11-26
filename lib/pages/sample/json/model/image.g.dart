// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['icon'] as String,
    json['name'] as String,
    json['desc'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'desc': instance.desc,
    };
