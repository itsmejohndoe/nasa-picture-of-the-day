import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/features/listing/domain/entities/picture.dart';
import 'package:nasa_apod/features/listing/domain/repositories/listing_repository_contract.dart';
import 'package:nasa_apod/features/listing/domain/usecases/get_pictures_list.dart';

class MockListingRepository extends Mock implements ListingRepositoryContract {}

void main() {
  late MockListingRepository mockListingRepository;
  late GetPicturesList getPicturesList;

  setUpAll(() {
    mockListingRepository = MockListingRepository();
    getPicturesList = GetPicturesList(mockListingRepository);
  });

  test('check if repository is correctly called', () async {
    // Arrange
    when(() => mockListingRepository.listPictures()).thenAnswer((_) async => const Right(<Picture>[]));
    // Act
    final result = await getPicturesList();
    // Assert
    verify(() => mockListingRepository.listPictures()).called(1);
    expect(result.isRight(), true);
  });
}
