import '../../shared/enums/media_type.dart';

abstract class MediaTypeConverter {
  static MediaType fromJson(dynamic value) => MediaType.fromValue(value);

  static String toJson(MediaType value) => value.type;
}
