import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/features/listing/data/datasources/listing_local_data_source.dart';
import 'package:nasa_apod/features/listing/data/models/picture_model.dart';
import 'package:nasa_apod/features/listing/shared/enums/media_type.dart';
import 'package:nasa_apod/shared/storage/preferences.dart';

class MockPreferences extends Mock implements Preferences {}

void main() {
  late MockPreferences mockPreferences;
  late ListingLocalDataSourceContract listingLocalDataSource;

  setUpAll(() {
    mockPreferences = MockPreferences();
    listingLocalDataSource = ListingLocalDataSource(mockPreferences);
  });

  group('tests for [ListingLocalDataSource.set]', () {
    test('check if [.set] is handling correctly empty arrays', () async {
      // Arrange
      when(() => mockPreferences.set<String>(any(), any())).thenAnswer((_) async => Future.value);
      // Act
      await listingLocalDataSource.store([]);
      // Assert
      verifyNever(() => mockPreferences.set<String>(any(), any()));
    });

    test('check if [.set] is storing the data correctly', () async {
      // Arrange
      when(() => mockPreferences.set<String>(any(), any())).thenAnswer((_) async => Future.value);
      // Act
      await listingLocalDataSource.store([const PictureModel('', '', '', '', '', '', '', MediaType.image, '')]);
      // Assert
      verify(() => mockPreferences.set<String>(any(), any())).called(1);
    });
  });

  group('tests for [ListingLocalDataSource.get]', () {
    test('check if [.get] is handling empty state where no date were previously set', () async {
      // Arrange
      when(() => mockPreferences.get<String>(any())).thenReturn(null);
      // Act
      final result = await listingLocalDataSource.retrieve();
      // Assert
      verify(() => mockPreferences.get<String>(any())).called(1);
      expect(result, isNull);
    });

    test('check if [.get] is handling empty string when reading stored', () async {
      // Arrange
      when(() => mockPreferences.get<String>(any())).thenReturn('');
      // Act
      final result = await listingLocalDataSource.retrieve();
      // Assert
      verify(() => mockPreferences.get<String>(any())).called(1);
      expect(result, isNull);
    });

    test('check if [.get] is storing the data correctly', () async {
      // Arrange
      when(() => mockPreferences.get<String>(any())).thenReturn(
          '[{"copyright":"","date":"","title":"","explanation":"","url":"","media_type":"image","service_version":"","thumbnail_url":"","hdurl":""}]');
      // Act
      final result = await listingLocalDataSource.retrieve();
      // Assert
      verify(() => mockPreferences.get<String>(any())).called(1);
      expect(result, isNotNull);
      expect(result!.length, 1);
    });
  });
}
