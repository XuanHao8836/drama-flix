
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drama_flix/feature/splash/domain/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;

  ConnectivityRepositoryImpl(this._connectivity);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}