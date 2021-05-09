import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/wealth_summary.dart';

abstract class WealthSummaryRepository {
  Future<Either<Failure, WealthSummary>> getWealthSummary();
}
