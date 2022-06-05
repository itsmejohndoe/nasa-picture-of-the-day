import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/features/listing/data/datasources/listing_remote_data_source.dart';
import 'package:nasa_apod/shared/device/network_info.dart';
import 'package:nasa_apod/shared/exceptions/network_exception.dart';
import 'package:nasa_apod/shared/exceptions/server_exception.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockDio extends Mock implements Dio {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late DioAdapter dioAdapter;
  late Dio dio;
  late ListingRemoteDataSourceContract listingRemoteDataSource;

  setUpAll(() {
    mockNetworkInfo = MockNetworkInfo();
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    listingRemoteDataSource = ListingRemoteDataSource(mockNetworkInfo, dio);
  });

  group('tests for [ListingRemoteDataSource.getPictures]', () {
    group('offline tests', () {
      test('check if [NetworkException] is thrown when device is offline', () {
        // Arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // Act
        // Assert
        expect(listingRemoteDataSource.getPictures(), throwsA(isA<NetworkException>()));
      });
    });

    group('online tests', () {
      setUpAll(() => when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true));

      test('check if [List<Picture>] is correctly returned when status code is 200', () async {
        // Arrange
        dioAdapter.onGet(
            'https://api.nasa.gov/planetary/apod', (server) => server.reply(200, jsonDecode(fixture('pictures.json'))));
        // Act
        final result = await listingRemoteDataSource.getPictures();
        // Assert
        expect(result.isNotEmpty, true);
        expect(result.length, 32);
      });

      test('check if [ServerException] is thrown when status code is != from 200', () {
        // Arrange
        dioAdapter.onGet('https://api.nasa.gov/planetary/apod', (server) => server.reply(400, 'error'));
        // Act
        // Assert
        expect(listingRemoteDataSource.getPictures(), throwsA(isA<ServerException>()));
      });
    });
  });
}
