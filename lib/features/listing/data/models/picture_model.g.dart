// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) => PictureModel(
      json['copyright'] as String,
      json['date'] as String,
      json['title'] as String,
      json['explanation'] as String,
      json['url'] as String,
      json['thumbnail_url'] as String?,
      json['hdurl'] as String?,
      MediaTypeConverter.fromJson(json['media_type']),
      json['service_version'] as String,
    );

Map<String, dynamic> _$PictureModelToJson(PictureModel instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'title': instance.title,
      'explanation': instance.explanation,
      'url': instance.url,
      'media_type': MediaTypeConverter.toJson(instance.mediaType),
      'service_version': instance.serviceVersion,
      'thumbnail_url': instance.thumbnailUrl,
      'hdurl': instance.hdImageUrl,
    };
