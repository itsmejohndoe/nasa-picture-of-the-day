import '../../../../shared/storage/preferences.dart';
import '../models/picture_model.dart';

abstract class ListingLocalDataSourceContract {
  Future<void> store(List<PictureModel> pictures);
  Future<List<PictureModel>?> retrieve();
}

class ListingLocalDataSource extends ListingLocalDataSourceContract {
  final Preferences _preferences;

  ListingLocalDataSource(this._preferences);

  @override
  Future<List<PictureModel>?> retrieve() {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<void> store(List<PictureModel> pictures) {
    // TODO: implement store
    throw UnimplementedError();
  }
}
