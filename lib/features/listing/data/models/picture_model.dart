import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../shared/enums/media_type.dart';
import '../converters/media_type_converter.dart';

part 'picture_model.g.dart';

@JsonSerializable()
class PictureModel extends Equatable {
  final String date;
  final String title;
  final String explanation;
  final String url;
  @JsonKey(name: 'media_type', fromJson: MediaTypeConverter.fromJson, toJson: MediaTypeConverter.toJson)
  final MediaType mediaType;
  @JsonKey(name: 'service_version')
  final String serviceVersion;
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  @JsonKey(name: 'hdurl')
  final String? hdImageUrl;
  final String? copyright;

  const PictureModel(
    this.copyright,
    this.date,
    this.title,
    this.explanation,
    this.url,
    this.thumbnailUrl,
    this.hdImageUrl,
    this.mediaType,
    this.serviceVersion,
  );

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureModelToJson(this);

  @override
  List<Object?> get props => [
        copyright,
        date,
        title,
        explanation,
        url,
        thumbnailUrl,
        hdImageUrl,
        mediaType,
        serviceVersion,
      ];
}
