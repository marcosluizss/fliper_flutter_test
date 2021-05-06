import 'package:dartz/dartz.dart';
import 'package:fliper_flutter_test/core/error/exceptions.dart';

import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/core/infra/network_info.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/datasources/wealth_summary_remote_datasource.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';

class WealthSummaryRepositoryImpl implements WealthSummaryRepository {
  final NetworkInfo networkInfo;
  final WealthSummaryRemoteDataSource wealthSummaryRemoteDataSource;

  WealthSummaryRepositoryImpl({
    required this.networkInfo,
    required this.wealthSummaryRemoteDataSource,
  });

  @override
  Future<Either<Failure, WealthSummary>> getWealthSummary() async {
    if (!await networkInfo.isConnected) {
      return Left(NotConnectedFailure());
    }
    try {
      return Right(await wealthSummaryRemoteDataSource.getWealthSummary());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
