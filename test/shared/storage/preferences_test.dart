import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/shared/storage/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late Preferences preferences;

  setUpAll(() {
    mockSharedPreferences = MockSharedPreferences();
    preferences = Preferences(mockSharedPreferences);

    when(() => mockSharedPreferences.setString(any(), any())).thenAnswer((_) async => true);
    when(() => mockSharedPreferences.setBool(any(), any())).thenAnswer((_) async => true);
    when(() => mockSharedPreferences.getString(any())).thenReturn('value');
    when(() => mockSharedPreferences.getBool(any())).thenReturn(true);
  });

  group('tests for [Preferences.set]', () {
    test('check if [.set] is working properly for [bool] types', () async {
      // Arrange
      // Act
      await preferences.set<bool>('key', true);
      // Assert
      verify(() => mockSharedPreferences.setBool(any(), any())).called(1);
    });

    test('check if [.set] is working properly for [String] types', () async {
      // Arrange
      // Act
      await preferences.set<String>('key', 'value');
      // Assert
      verify(() => mockSharedPreferences.setString(any(), any())).called(1);
    });
  });

  group('tests for [Preferences.get]', () {
    test('check if [.get] is working properly for [bool] types', () async {
      // Arrange
      // Act
      final result = preferences.get<bool>('key');
      // Assert
      verify(() => mockSharedPreferences.getBool(any())).called(1);
      expect(result, true);
    });

    test('check if [.get] is working properly for [String] types', () async {
      // Arrange
      // Act
      final result = preferences.get<String>('key');
      // Assert
      verify(() => mockSharedPreferences.getString(any())).called(1);
      expect(result, 'value');
    });
  });
}
