import 'package:fliper_flutter_test/core/infra/network_info.dart';
import 'package:mockito/mockito.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected =>
      super.noSuchMethod(Invocation.method(#isConnected, [])) ??
      Future.value(false);

  @override
  Stream<bool> onConnectivityChanged() =>
      super.noSuchMethod(Invocation.method(#onConnectivityChanged, [])) ??
      Stream.value(false);
}
