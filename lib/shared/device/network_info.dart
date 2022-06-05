import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  Future<bool> get isConnected async {
    final status = await _connectivity.checkConnectivity();
    return status != ConnectivityResult.none;
  }
}
