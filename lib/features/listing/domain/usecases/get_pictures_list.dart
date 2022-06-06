import 'package:dartz/dartz.dart';

import '../../../../shared/failures/custom_failure.dart';
import '../entities/picture.dart';
import '../repositories/listing_repository_contract.dart';

class GetPicturesList {
  final ListingRepositoryContract _listingRepository;

  GetPicturesList(this._listingRepository);

  Future<Either<CustomFailure, List<Picture>>> call() async {
    return _listingRepository.listPictures();
  }
}
