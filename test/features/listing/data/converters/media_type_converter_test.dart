import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod/features/listing/data/converters/media_type_converter.dart';
import 'package:nasa_apod/features/listing/shared/enums/media_type.dart';

void main() {
  group('tests for [MediaTypeConverter.fromJson]', () {
    test('check if ["image"] is correctly converted to [MediaType.image]', () {
      // Arrange
      // Act
      final type = MediaTypeConverter.fromJson('image');
      // Assert
      expect(type, MediaType.image);
    });

    test('check if ["video"] is correctly converted to [MediaType.video]', () {
      // Arrange
      // Act
      final type = MediaTypeConverter.fromJson('video');
      // Assert
      expect(type, MediaType.video);
    });

    test('check if ["hauhduada"] is correctly converted to [MediaType.video]', () {
      // Arrange
      // Act
      final type = MediaTypeConverter.fromJson('hauhduada');
      // Assert
      expect(type, MediaType.video);
    });
  });

  group('tests for [MediaTypeConverter.toJson]', () {
    test('check if [MediaType.image] is correctly converted to ["image"]', () {
      // Arrange
      // Act
      final type = MediaTypeConverter.toJson(MediaType.image);
      // Assert
      expect(type, 'image');
    });

    test('check if [MediaType.video] is correctly converted to ["video"]', () {
      // Arrange
      // Act
      final type = MediaTypeConverter.toJson(MediaType.video);
      // Assert
      expect(type, 'video');
    });
  });
}
