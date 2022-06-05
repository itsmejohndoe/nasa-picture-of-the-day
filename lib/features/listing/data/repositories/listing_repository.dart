import 'package:dartz/dartz.dart';

import '../../../../shared/failures/custom_failure.dart';
import '../../domain/entities/picture.dart';
import '../../domain/repositories/listing_repository_contract.dart';
import '../datasources/listing_local_data_source.dart';
import '../datasources/listing_remote_data_source.dart';

class ListingRepository extends ListingRepositoryContract {
  final ListingLocalDataSourceContract _localDataSource;
  final ListingRemoteDataSourceContract _remoteDataSource;

  ListingRepository(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<CustomFailure, List<Picture>>> listPictures() {
    // TODO: implement listPictures
    throw UnimplementedError();
  }
}
