import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> onConnectivityChanged();
}

class NetworkIndoImpl implements NetworkInfo {
  final Connectivity connectionChecker;
  bool hasConnection = false;

  NetworkIndoImpl(this.connectionChecker);

  void _validateConnection(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      hasConnection = false;
    }
    hasConnection = true;
  }

  _initConnection() async {
    var connectivityResult = await (connectionChecker.checkConnectivity());
    _validateConnection(connectivityResult);
  }

  @override
  Future<bool> get isConnected async {
    await _initConnection();
    return hasConnection;
  }

  @override
  Stream<bool> onConnectivityChanged() {
    return connectionChecker.onConnectivityChanged
        .transform(ConnectionTransformer.broadcast());
  }
}

class ConnectionTransformer<S, T> implements StreamTransformer<S, T> {
  late StreamController _controller;
  StreamSubscription? _subscription;

  late bool cancelOnError;

  late Stream<S> _stream;

  ConnectionTransformer({bool sync: false, this.cancelOnError = true}) {
    _controller = new StreamController<T>(
      onListen: _onListen,
      onCancel: _onCancel,
      onPause: () => _subscription?.pause(),
      onResume: () => _subscription?.resume(),
      sync: sync,
    );
  }

  ConnectionTransformer.broadcast({
    bool sync: false,
    this.cancelOnError = false,
  }) {
    _controller = new StreamController<T>.broadcast(
      onListen: _onListen,
      onCancel: _onCancel,
      sync: sync,
    );
  }

  void _onListen() {
    _subscription = _stream.listen(onData,
        onError: _controller.addError,
        onDone: _controller.close,
        cancelOnError: cancelOnError);
  }

  void _onCancel() {
    _subscription?.cancel();
    _subscription = null;
  }

  //transformation
  void onData(S data) {
    if (data is ConnectivityResult) {
      if (data == ConnectivityResult.none) {
        _controller.add(false);
      } else {
        _controller.add(true);
      }
    } else {
      _controller.add(data);
    }
  }

  @override
  Stream<T> bind(Stream<S> stream) {
    this._stream = stream;
    return _controller.stream as Stream<T>;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() => StreamTransformer.castFrom(this);
}
