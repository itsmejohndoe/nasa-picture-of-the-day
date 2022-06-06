import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/listing/data/datasources/listing_local_data_source.dart';
import 'features/listing/data/datasources/listing_remote_data_source.dart';
import 'features/listing/data/repositories/listing_repository.dart';
import 'features/listing/domain/repositories/listing_repository_contract.dart';
import 'features/listing/domain/usecases/get_pictures_list.dart';
import 'features/listing/presentation/state/listing_bloc.dart';
import 'shared/device/network_info.dart';
import 'shared/storage/preferences.dart';

GetIt di = GetIt.instance;

Future<void> setup() async {
  // Shared
  di.registerSingleton<NetworkInfo>(NetworkInfo(Connectivity()));
  di.registerSingleton<Preferences>(Preferences(await SharedPreferences.getInstance()));

  // Features
  // # Listing
  // # Listing - data
  di.registerSingleton<ListingLocalDataSourceContract>(ListingLocalDataSource(di()));
  di.registerSingleton<ListingRemoteDataSourceContract>(ListingRemoteDataSource(di(), Dio()));
  // # Listing - domain
  di.registerSingleton<ListingRepositoryContract>(ListingRepository(di(), di()));
  di.registerSingleton<GetPicturesList>(GetPicturesList(di()));
  // # Listing - presentation
  di.registerSingleton<ListingBloc>(ListingBloc(di()));
}
