import 'dart:convert';

import '../../../../shared/storage/preferences.dart';
import '../models/picture_model.dart';

abstract class ListingLocalDataSourceContract {
  Future<void> store(List<PictureModel> pictures);
  Future<List<PictureModel>?> retrieve();
}

class ListingLocalDataSource extends ListingLocalDataSourceContract {
  static const _preferencesKey = 'k_listing';

  final Preferences _preferences;

  ListingLocalDataSource(this._preferences);

  @override
  Future<List<PictureModel>?> retrieve() async {
    final stored = _preferences.get<String>(_preferencesKey);
    if (stored == null || stored.isEmpty) {
      return null;
    }

    return (jsonDecode(stored) as List).map((e) => PictureModel.fromJson(e)).toList();
  }

  @override
  Future<void> store(List<PictureModel> pictures) async {
    if (pictures.isEmpty) {
      return;
    }

    await _preferences.set<String>(_preferencesKey, jsonEncode(pictures.map((e) => e.toJson()).toList()));
  }
}
