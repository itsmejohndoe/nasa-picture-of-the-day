import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/shared/device/network_info.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MockConnectivity mockConnectivity;
  late NetworkInfo networkInfo;

  setUpAll(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfo(mockConnectivity);
  });

  test('check if [isConnected] return [false] when device has no connection', () async {
    // Arrange
    when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.none);
    // Act
    final isConnected = await networkInfo.isConnected;
    // Assert
    expect(isConnected, false);
  });

  test('check if [isConnected] return [true] when device has Wifi', () async {
    // Arrange
    when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
    // Act
    final isConnected = await networkInfo.isConnected;
    // Assert
    expect(isConnected, true);
  });

  test('check if [isConnected] return false when device has Mobile Network', () async {
    // Arrange
    when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.mobile);
    // Act
    final isConnected = await networkInfo.isConnected;
    // Assert
    expect(isConnected, true);
  });
}
