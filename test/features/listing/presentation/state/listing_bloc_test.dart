import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod/features/listing/domain/entities/picture.dart';
import 'package:nasa_apod/features/listing/domain/usecases/get_pictures_list.dart';
import 'package:nasa_apod/features/listing/presentation/state/listing_bloc.dart';
import 'package:nasa_apod/shared/failures/server_failure.dart';

class MockGetPicturesList extends Mock implements GetPicturesList {}

void main() {
  late MockGetPicturesList mockGetPicturesList;

  setUpAll(() {
    mockGetPicturesList = MockGetPicturesList();
  });

  group('tests for [LoadListing] event', () {
    group('tests for unsuccessful scenarios', () {
      blocTest(
        'check if states are correctly emitted when an ERROR occur: [ListingStatus.loading, ListingStatus.error]',
        setUp: () => when(() => mockGetPicturesList()).thenAnswer((_) async => const Left(ServerFailure('failed'))),
        build: () => ListingBloc(mockGetPicturesList),
        act: (ListingBloc bloc) => bloc.add(LoadListing()),
        expect: () => [
          ListingState.idle().copyWith(status: ListingStatus.loading),
          ListingState.idle()
              .copyWith(status: ListingStatus.loading)
              .copyWith(status: ListingStatus.error, failure: const ServerFailure('failed')),
        ],
      );
    });

    group('test for successful scenarios', () {
      blocTest(
        'check if states are correctly emitted when an RECOVERING from a ERROR state: [ListingStatus.loading, ListingStatus.ready]',
        setUp: () => when(() => mockGetPicturesList()).thenAnswer((_) async => const Right(<Picture>[])),
        build: () => ListingBloc(mockGetPicturesList),
        seed: () => ListingState.idle().copyWith(status: ListingStatus.error, failure: const ServerFailure('failed')),
        act: (ListingBloc bloc) => bloc.add(LoadListing()),
        expect: () => [
          ListingState.idle()
              .copyWith(status: ListingStatus.loading)
              .copyWith(status: ListingStatus.error, failure: const ServerFailure('failed'))
              .copyWith(status: ListingStatus.loading),
          ListingState.idle()
              .copyWith(status: ListingStatus.loading)
              .copyWith(status: ListingStatus.error, failure: const ServerFailure('failed'))
              .copyWith(status: ListingStatus.loading)
              .copyWith(status: ListingStatus.ready, data: <Picture>[]),
        ],
      );

      blocTest(
        'check if states are correctly emitted when everything has worked: [ListingStatus.loading, ListingStatus.ready]',
        setUp: () => when(() => mockGetPicturesList()).thenAnswer((_) async => const Right(<Picture>[])),
        build: () => ListingBloc(mockGetPicturesList),
        act: (ListingBloc bloc) => bloc.add(LoadListing()),
        expect: () => [
          ListingState.idle().copyWith(status: ListingStatus.loading),
          ListingState.idle()
              .copyWith(status: ListingStatus.loading)
              .copyWith(status: ListingStatus.ready, data: <Picture>[]),
        ],
      );
    });
  });

  group('tests for [SearchListing event]', () {
    blocTest(
      'check if states are correctly emitted when search for a non empty and non null text: [ListingStatus.ready]',
      build: () => ListingBloc(mockGetPicturesList),
      act: (ListingBloc bloc) => bloc.add(SearchListing('testing')),
      expect: () => [
        ListingState.idle().copyWith(search: 'testing'),
      ],
    );

    blocTest(
      'check if states are correctly emitted when search for a null text: [ListingStatus.ready]',
      build: () => ListingBloc(mockGetPicturesList),
      seed: () => ListingState.idle().copyWith(search: 'testing'),
      act: (ListingBloc bloc) => bloc.add(SearchListing(null)),
      expect: () => [
        ListingState.idle().copyWith(search: null),
      ],
    );
  });
}
