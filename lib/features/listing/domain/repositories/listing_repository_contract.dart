import 'package:dartz/dartz.dart';

import '../../../../shared/failures/custom_failure.dart';
import '../entities/picture.dart';

abstract class ListingRepositoryContract {
  Future<Either<CustomFailure, List<Picture>>> listPictures();
}
