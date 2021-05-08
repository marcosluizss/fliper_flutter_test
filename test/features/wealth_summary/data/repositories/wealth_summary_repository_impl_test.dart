import 'package:dartz/dartz.dart';
import 'package:fliper_flutter_test/core/error/exceptions.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/datasources/wealth_summary_remote_datasource.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/repositories/wealth_summary_repository_impl.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../common_mocks.dart';

class MockWealthSummaryRemoteDataSource extends Mock
    implements WealthSummaryRemoteDataSource {
  final tWealthSummaryModel = WealthSummaryModel(
    id: 0,
    cdi: 0,
    gain: 0,
    hasHistory: false,
    profitability: 0,
    total: 0,
  );

  @override
  Future<WealthSummaryModel> getWealthSummary() =>
      super.noSuchMethod(Invocation.method(#getWealthSummary, [])) ??
      Future.value(tWealthSummaryModel);
}

void main() {
  late WealthSummaryRepositoryImpl wealthSummaryRepositoryImpl;
  late MockWealthSummaryRemoteDataSource mockWealthSummaryRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockWealthSummaryRemoteDataSource = MockWealthSummaryRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    wealthSummaryRepositoryImpl = WealthSummaryRepositoryImpl(
      wealthSummaryRemoteDataSource: mockWealthSummaryRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getWealthSummary', () {
    final tWealthSummaryModel = WealthSummaryModel(
      id: 2,
      cdi: 2.4456,
      gain: 14.5511,
      hasHistory: false,
      profitability: 0.58484,
      total: 1864.45,
    );
    final WealthSummary tWealthSummary = tWealthSummaryModel;

    configNetworkInfo({required bool isConnected}) {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => isConnected);
    }

    configConnectionTest(bool isConnected) {
      configNetworkInfo(isConnected: isConnected);
      when(mockWealthSummaryRemoteDataSource.getWealthSummary())
          .thenThrow(ServerException());
    }

    test('should check if the device is connected', () async {
      configConnectionTest(true);

      wealthSummaryRepositoryImpl.getWealthSummary();

      verify(mockNetworkInfo.isConnected);
      verifyNever(mockWealthSummaryRemoteDataSource.getWealthSummary());
    });

    test('should return a NotConnectedFailure if device is not connected ',
        () async {
      configConnectionTest(false);

      final result = await wealthSummaryRepositoryImpl.getWealthSummary();

      expect(result, Left(NotConnectedFailure()));
      verify(mockNetworkInfo.isConnected);
      verifyNever(mockWealthSummaryRemoteDataSource.getWealthSummary());
    });

    test('should return data when the call to remote data source is successful',
        () async {
      configNetworkInfo(isConnected: true);
      when(mockWealthSummaryRemoteDataSource.getWealthSummary())
          .thenAnswer((_) async => tWealthSummaryModel);

      final result = await wealthSummaryRepositoryImpl.getWealthSummary();

      verify(mockWealthSummaryRemoteDataSource.getWealthSummary());
      expect(result, Right(tWealthSummary));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      configNetworkInfo(isConnected: true);
      when(mockWealthSummaryRemoteDataSource.getWealthSummary())
          .thenThrow(ServerException());

      final result = await wealthSummaryRepositoryImpl.getWealthSummary();

      verify(mockWealthSummaryRemoteDataSource.getWealthSummary());
      expect(result, Left(ServerFailure()));
    });
  });
}
