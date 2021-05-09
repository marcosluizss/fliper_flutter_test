import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/wealth_summary.dart';
import '../repositories/wealth_summary_repository.dart';

class GetWealthSummary {
  final WealthSummaryRepository wealthSummaryRepository;

  GetWealthSummary(this.wealthSummaryRepository);

  Future<Either<Failure, WealthSummary>> call() async {
    return wealthSummaryRepository.getWealthSummary();
  }
}
