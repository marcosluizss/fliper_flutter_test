import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/infra/network_info.dart';
import '../../domain/entities/wealth_summary.dart';
import '../../domain/repositories/wealth_summary_repository.dart';
import '../datasources/wealth_summary_remote_datasource.dart';

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
