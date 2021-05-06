import 'package:dartz/dartz.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';

class GetWealthSummary {
  final WealthSummaryRepository wealthSummaryRepository;

  GetWealthSummary(this.wealthSummaryRepository);

  Future<Either<Failure, WealthSummary>> call() async {
    return wealthSummaryRepository.getWealthSummary();
  }
}
