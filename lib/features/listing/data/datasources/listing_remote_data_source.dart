import 'package:dio/dio.dart';

import '../../../../shared/device/network_info.dart';
import '../models/picture_model.dart';

abstract class ListingRemoteDataSourceContract {
  Future<List<PictureModel>> getPictures();
}

class ListingRemoteDataSource extends ListingRemoteDataSourceContract {
  final NetworkInfo _networkInfo;
  final Dio _httpCaller;

  ListingRemoteDataSource(this._networkInfo, this._httpCaller);

  @override
  Future<List<PictureModel>> getPictures() {
    // TODO: implement getPictures
    throw UnimplementedError();
  }
}
