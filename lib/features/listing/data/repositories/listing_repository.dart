import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/network_exception.dart';
import '../../../../shared/exceptions/server_exception.dart';
import '../../../../shared/failures/custom_failure.dart';
import '../../../../shared/failures/network_failure.dart';
import '../../../../shared/failures/server_failure.dart';
import '../../domain/entities/picture.dart';
import '../../domain/repositories/listing_repository_contract.dart';
import '../datasources/listing_local_data_source.dart';
import '../datasources/listing_remote_data_source.dart';
import '../models/picture_model.dart';

class ListingRepository extends ListingRepositoryContract {
  final ListingLocalDataSourceContract _localDataSource;
  final ListingRemoteDataSourceContract _remoteDataSource;

  ListingRepository(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<CustomFailure, List<Picture>>> listPictures() async {
    List<Picture> fromModelList(List<PictureModel> list) => list.map((e) => e.toEntity()).toList();

    List<PictureModel>? cache;
    try {
      cache = await _localDataSource.retrieve();
      final result = await _remoteDataSource.getPictures();
      final reversed = result.reversed.toList();
      await _localDataSource.store(reversed);

      return Right(fromModelList(reversed));
    } on NetworkException catch (e) {
      if (cache == null) {
        return Left(NetworkFailure(e.message));
      }
      return Right(fromModelList(cache));
    } on ServerException catch (e) {
      if (cache == null) {
        return Left(ServerFailure(e.message));
      }
      return Right(fromModelList(cache));
    }
  }
}
