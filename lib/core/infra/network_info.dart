import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkIndoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkIndoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await (connectionChecker.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
