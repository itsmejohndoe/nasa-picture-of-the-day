import 'package:equatable/equatable.dart';

import '../../data/models/picture_model.dart';
import '../../shared/enums/media_type.dart';

class Picture extends Equatable {
  final String copyright;
  final String date;
  final String title;
  final String explanation;
  final String url;
  final MediaType mediaType;
  final String? thumbnailUrl;
  final String? hdImageUrl;

  const Picture(
    this.copyright,
    this.date,
    this.title,
    this.explanation,
    this.url,
    this.mediaType,
    this.thumbnailUrl,
    this.hdImageUrl,
  );

  @override
  List<Object?> get props => [
        copyright,
        date,
        title,
        explanation,
        url,
        mediaType,
        thumbnailUrl,
        hdImageUrl,
      ];
}

extension XPictureModel on PictureModel {
  Picture toEntity() => Picture(
        copyright,
        date,
        title,
        explanation,
        url,
        mediaType,
        thumbnailUrl,
        hdImageUrl,
      );
}
